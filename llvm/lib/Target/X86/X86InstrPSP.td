/**
 * Programmable Streaming Prefetch (PSP) instructions' opcode are 0x0F 0x38 0x6X, with no prefix.
 * Editor: K16DIABLO (Sungjun Jung)
 */

class IPSP<bits<8> o, Format f, ImmType i, dag outs, dag ins, 
           string asm, list<dag> pattern>
  : X86Inst<o, f, i, outs, ins, asm>, T8 {
  let Pattern = pattern;
  let CodeSize = 3; 
}

def STREAM_CFG_IDX_BASE
  : IPSP<0x60, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$base),
         "stream.cfg.idx.base\t{$stream, $base|$base, $stream}",
         [(int_stream_cfg_idx_base GR64:$stream, GR64:$base)]>;

def STREAM_CFG_IDX_GRAN
  : IPSP<0x61, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$granularity),
         "stream.cfg.idx.gran\t{$stream, $granularity|$granularity, $stream}",
         [(int_stream_cfg_idx_gran GR64:$stream, GR64:$granularity)]>;

def STREAM_CFG_VAL_BASE
  : IPSP<0x62, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$base),
         "stream.cfg.val.base\t{$stream, $base|$base, $stream}",
         [(int_stream_cfg_val_base GR64:$stream, GR64:$base)]>;

def STREAM_CFG_VAL_GRAN
  : IPSP<0x63, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$granularity),
         "stream.cfg.val.gran\t{$stream, $granularity|$granularity, $stream}",
         [(int_stream_cfg_val_gran GR64:$stream, GR64:$granularity)]>;

def STREAM_INPUT_OFFSET_BEGIN
  : IPSP<0x64, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$value),
         "stream.input.offset.begin\t{$stream, $value|$value, $stream}",
         [(int_stream_input_offset_begin GR64:$stream, GR64:$value)]>;

def STREAM_INPUT_OFFSET_END
  : IPSP<0x65, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream, GR64:$value),
         "stream.input.offset.end\t{$stream, $value|$value, $stream}",
         [(int_stream_input_offset_end GR64:$stream, GR64:$value)]>;

def STREAM_TERMINATE
  : IPSP<0x66, 
         MRMXr, 
         NoImm,
         (outs),
         (ins GR64:$stream),
         "stream.terminate\t{$stream|$stream}",
         [(int_stream_terminate GR64:$stream)]>;
