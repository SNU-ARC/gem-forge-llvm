/**
 * Programmable Streaming Prefetch (PSP) instructions' opcode are 0x0F 0x38 0x6X, with no prefix.
 * Editor: K16DIABLO (Sungjun Jung)
 * TODO: All instructions should be defined as R-format
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
         Imm8,
         (outs),
         (ins GR64:$base, i64i8imm:$stream),
         "stream.cfg.idx.base\t{$stream, $base|$base, $stream}",
         [(int_stream_cfg_idx_base i64immSExt8:$stream, GR64:$base)]>;

def STREAM_CFG_IDX_GRAN
  : IPSP<0x61, 
         MRMXr, 
         Imm8,
         (outs),
         (ins GR64:$granularity, i64i8imm:$stream),
         "stream.cfg.idx.gran\t{$stream, $granularity|$granularity, $stream}",
         [(int_stream_cfg_idx_gran i64immSExt8:$stream, GR64:$granularity)]>;

def STREAM_CFG_VAL_BASE
  : IPSP<0x62, 
         MRMXr, 
         Imm8,
         (outs),
         (ins GR64:$base, i64i8imm:$stream),
         "stream.cfg.val.base\t{$stream, $base|$base, $stream}",
         [(int_stream_cfg_val_base i64immSExt8:$stream, GR64:$base)]>;

def STREAM_CFG_VAL_GRAN
  : IPSP<0x63, 
         MRMXr, 
         Imm8,
         (outs),
         (ins GR64:$granularity, i64i8imm:$stream),
         "stream.cfg.val.gran\t{$stream, $granularity|$granularity, $stream}",
         [(int_stream_cfg_val_gran i64immSExt8:$stream, GR64:$granularity)]>;

def STREAM_INPUT_OFFSET_BEGIN
  : IPSP<0x64, 
         MRMXr, 
         Imm8,
         (outs),
         (ins GR64:$value, i64i8imm:$stream),
         "stream.input.offset.begin\t{$stream, $value|$value, $stream}",
         [(int_stream_input_offset_begin i64immSExt8:$stream, GR64:$value)]>;

def STREAM_INPUT_OFFSET_END
  : IPSP<0x65, 
         MRMXr, 
         Imm8,
         (outs),
         (ins GR64:$value, i64i8imm:$stream),
         "stream.input.offset.end\t{$stream, $value|$value, $stream}",
         [(int_stream_input_offset_end i64immSExt8:$stream, GR64:$value)]>;

def STREAM_TERMINATE
  : IPSP<0x66, 
         RawFrm, 
         Imm8,
         (outs),
         (ins i64i8imm:$stream),
         "stream.terminate\t{$stream|$stream}",
         [(int_stream_terminate i64immSExt8:$stream)]>;

def STREAM_CFG_READY
  : IPSP<0x67, 
         RawFrm, 
         Imm8,
         (outs),
         (ins i64i8imm:$stream),
         "stream.cfg.ready\t{$stream|$stream}",
         [(int_stream_cfg_ready i64immSExt8:$stream)]>;

def STREAM_INPUT_READY
  : IPSP<0x68, 
         RawFrm, 
         Imm8,
         (outs),
         (ins i64i8imm:$stream),
         "stream.input.ready\t{$stream|$stream}",
         [(int_stream_input_ready i64immSExt8:$stream)]>;
