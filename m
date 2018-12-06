From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: dwc2: Disable power down feature on Samsung SoCs
Date: Thu, 6 Dec 2018 15:20:23 +0100
Message-ID: <abb9bb4d-968a-6c78-14c2-5b56b769572b@samsung.com>
References: <CGME20181120153828eucas1p206d442b12c16588662c0e3f731ba58c3@eucas1p2.samsung.com>
        <20181120153815.31897-1-m.szyprowski@samsung.com>
        <3AD91E696667BF4BA728303C178E8A63532C68EA@am04wembxb.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3AD91E696667BF4BA728303C178E8A63532C68EA@am04wembxb.internal.synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Artur Petrosyan <arthur.petrosyan@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Artur,

On 2018-12-04 15:28, Artur Petrosyan wrote:
> On 11/20/2018 19:38, Marek Szyprowski wrote:
>> Power down feature of DWC2 module integrated in Samsung SoCs doesn't work
>> properly or needs some additional handling in PHY or SoC glue layer, so
>> disable it for now. Without disabling power down, DWC2 causes random memory
>> trashes and fails enumeration if there is no USB link to host on driver
>> probe.
>>
>> Fixes: 03ea6d6e9e1ff1 ("usb: dwc2: Enable power down")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/usb/dwc2/params.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index 7c1b6938f212..266157ae179a 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -71,6 +71,13 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
>>   	p->power_down = false;
>>   }
>>   
>> +static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
>> +{
>> +	struct dwc2_core_params *p = &hsotg->params;
>> +
>> +	p->power_down = 0;
>> +}
>> +
>>   static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
>>   {
>>   	struct dwc2_core_params *p = &hsotg->params;
>> @@ -151,7 +158,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>>   	{ .compatible = "lantiq,arx100-usb", .data = dwc2_set_ltq_params },
>>   	{ .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
>>   	{ .compatible = "snps,dwc2" },
>> -	{ .compatible = "samsung,s3c6400-hsotg" },
>> +	{ .compatible = "samsung,s3c6400-hsotg",
>> +	  .data = dwc2_set_s3c6400_params },
>>   	{ .compatible = "amlogic,meson8-usb",
>>   	  .data = dwc2_set_amlogic_params },
>>   	{ .compatible = "amlogic,meson8b-usb",
>>
> Could you please provide dmesg logs with verbose Debug enabled 
> configuration and the register dump.
> So that we can see what the issue is related to.

I'm not sure if this helps much. The problem happens if usb cable is not
connected on boot. Then, when I connect and disconnect USB cable,
strange memory trashes happens. From brief tests, the trashing doesn't
happen when debug messages are enabled, so it is related to timings.
IMHO the simplest fix for now is to disable powerdown on Samsung SoCs.

Here is the initialization related part (booted without usb cable
connected):

# dmesg | grep dwc
[    2.261821] dwc2 12480000.hsotg: Linked as a consumer to regulator.15
[    2.266410] dwc2 12480000.hsotg: Linked as a consumer to regulator.12
[    2.273996] dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter
besl=1
[    2.279405] dwc2 12480000.hsotg: dwc2_check_params: Invalid parameter
g_np_tx_fifo_size=1024
[    2.287882] dwc2 12480000.hsotg: NonPeriodic TXFIFO size: 768
[    2.287894] dwc2 12480000.hsotg: RXFIFO size: 2048
[    2.288003] dwc2 12480000.hsotg: EPs: 16, dedicated fifos, 7808
entries in SPRAM
[    2.296631] dwc2 12480000.hsotg: DCFG=0x08200000, DCTL=0x00000000,
DIEPMSK=00000000
[    2.303044] dwc2 12480000.hsotg: GAHBCFG=0x00000000, GHWCFG1=0x00000000
[    2.309437] dwc2 12480000.hsotg: GRXFSIZ=0x00001f00, GNPTXFSIZ=0x03001f00
[    2.316258] dwc2 12480000.hsotg: DPTx[1] FSize=768, StAddr=0x00002200
[    2.322630] dwc2 12480000.hsotg: DPTx[2] FSize=768, StAddr=0x00002500
[    2.329099] dwc2 12480000.hsotg: DPTx[3] FSize=768, StAddr=0x00002800
[    2.335521] dwc2 12480000.hsotg: DPTx[4] FSize=768, StAddr=0x00002b00
[    2.341900] dwc2 12480000.hsotg: DPTx[5] FSize=768, StAddr=0x00002e00
[    2.348366] dwc2 12480000.hsotg: DPTx[6] FSize=768, StAddr=0x00003100
[    2.354802] dwc2 12480000.hsotg: DPTx[7] FSize=768, StAddr=0x00003400
[    2.361169] dwc2 12480000.hsotg: DPTx[8] FSize=768, StAddr=0x00003700
[    2.367637] dwc2 12480000.hsotg: DPTx[9] FSize=768, StAddr=0x00003a00
[    2.374059] dwc2 12480000.hsotg: DPTx[10] FSize=768, StAddr=0x00003d00
[    2.380526] dwc2 12480000.hsotg: DPTx[11] FSize=768, StAddr=0x00004000
[    2.387079] dwc2 12480000.hsotg: DPTx[12] FSize=768, StAddr=0x00004300
[    2.393589] dwc2 12480000.hsotg: DPTx[13] FSize=768, StAddr=0x00004600
[    2.400055] dwc2 12480000.hsotg: DPTx[14] FSize=768, StAddr=0x00004900
[    2.406611] dwc2 12480000.hsotg: DPTx[15] FSize=768, StAddr=0x00004c00
[    2.413120] dwc2 12480000.hsotg: ep0-in: EPCTL=0x00008800,
SIZ=0x00000000, DMA=0x0562c0d2
[    2.421236] dwc2 12480000.hsotg: ep0-out: EPCTL=0x00008000,
SIZ=0x00000000, DMA=0xba24bb0f
[    2.429526] dwc2 12480000.hsotg: ep1-in: EPCTL=0x00001000,
SIZ=0x00000000, DMA=0xe1e5d4d6
[    2.437684] dwc2 12480000.hsotg: ep1-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x866fd8ec
[    2.445930] dwc2 12480000.hsotg: ep2-in: EPCTL=0x00001800,
SIZ=0x00000000, DMA=0xf04672ba
[    2.454091] dwc2 12480000.hsotg: ep2-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x254f4cad
[    2.462292] dwc2 12480000.hsotg: ep3-in: EPCTL=0x00002000,
SIZ=0x00000000, DMA=0x0031e893
[    2.470494] dwc2 12480000.hsotg: ep3-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0xa1fadc63
[    2.478740] dwc2 12480000.hsotg: ep4-in: EPCTL=0x00002800,
SIZ=0x00000000, DMA=0x070100d6
[    2.486899] dwc2 12480000.hsotg: ep4-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x5b73f99f
[    2.495147] dwc2 12480000.hsotg: ep5-in: EPCTL=0x00003000,
SIZ=0x00000000, DMA=0x22862241
[    2.503306] dwc2 12480000.hsotg: ep5-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x3e6dd3d7
[    2.511508] dwc2 12480000.hsotg: ep6-in: EPCTL=0x00003800,
SIZ=0x00000000, DMA=0x49d40c13
[    2.519711] dwc2 12480000.hsotg: ep6-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x75ef350a
[    2.527956] dwc2 12480000.hsotg: ep7-in: EPCTL=0x00004000,
SIZ=0x00000000, DMA=0xea58422e
[    2.536115] dwc2 12480000.hsotg: ep7-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0xf3ddcb57
[    2.544362] dwc2 12480000.hsotg: ep8-in: EPCTL=0x00004800,
SIZ=0x00000000, DMA=0xc643412d
[    2.552477] dwc2 12480000.hsotg: ep8-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x4ff685bc
[    2.560768] dwc2 12480000.hsotg: ep9-in: EPCTL=0x00005000,
SIZ=0x00000000, DMA=0xbf80c044
[    2.568926] dwc2 12480000.hsotg: ep9-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x7a4d7ff5
[    2.577171] dwc2 12480000.hsotg: ep10-in: EPCTL=0x00005800,
SIZ=0x00000000, DMA=0x095249a9
[    2.585418] dwc2 12480000.hsotg: ep10-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x53d9dd5c
[    2.593751] dwc2 12480000.hsotg: ep11-in: EPCTL=0x00006000,
SIZ=0x00000000, DMA=0xb6367224
[    2.601954] dwc2 12480000.hsotg: ep11-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x78fc77d9
[    2.610331] dwc2 12480000.hsotg: ep12-in: EPCTL=0x00006800,
SIZ=0x00000000, DMA=0x703a61f7
[    2.618588] dwc2 12480000.hsotg: ep12-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x4b6fdce6
[    2.626909] dwc2 12480000.hsotg: ep13-in: EPCTL=0x00007000,
SIZ=0x00000000, DMA=0x9028b9a8
[    2.635155] dwc2 12480000.hsotg: ep13-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x9ce3fc49
[    2.643487] dwc2 12480000.hsotg: ep14-in: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x142fa3a6
[    2.651690] dwc2 12480000.hsotg: ep14-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0x992fdfec
[    2.660067] dwc2 12480000.hsotg: ep15-in: EPCTL=0x00000800,
SIZ=0x00000000, DMA=0x455906b0
[    2.668312] dwc2 12480000.hsotg: ep15-out: EPCTL=0x00000000,
SIZ=0x00000000, DMA=0xd74dacd5
[    2.676643] dwc2 12480000.hsotg: DVBUSDIS=0x000017d7, DVBUSPULSE=000005b8
[    2.868931] dwc2 12480000.hsotg: bound driver g_ether
[    2.873603] dwc2 12480000.hsotg: dwc2_hsotg_pullup: is_on: 1 op_state: 3
[    2.873649] dwc2 12480000.hsotg: FIFOs reset, timeout at 100
[    2.873685] dwc2 12480000.hsotg: EP0: DIEPCTL0=0x00008000,
DOEPCTL0=0x00008000
[    2.873696] dwc2 12480000.hsotg: gsintmsk now 0xd88c3cc4
[    2.873719] dwc2 12480000.hsotg: DCTL=0x00000002
[    2.873731] dwc2 12480000.hsotg: GLPMCFG=0x00001483
[    2.876743] dwc2 12480000.hsotg: dwc2_hsotg_enqueue_setup: queueing
setup request
[    2.876756] dwc2 12480000.hsotg: ep0: req (ptrval): 8@(ptrval),
noi=0, zero=0, snok=0
[    2.876773] dwc2 12480000.hsotg: dwc2_hsotg_start_req:
DxEPCTL=0x80008000, ep 0, dir out
[    2.876783] dwc2 12480000.hsotg: ureq->length:8 ureq->actual:0
[    2.876795] dwc2 12480000.hsotg: dwc2_hsotg_start_req: 1@8/8,
0x00080008 => 0x00000b10
[    2.876807] dwc2 12480000.hsotg: dwc2_hsotg_start_req: b7043000 pad
=> 0x00000b14
[    2.876816] dwc2 12480000.hsotg: ep0 state:0
[    2.876825] dwc2 12480000.hsotg: dwc2_hsotg_start_req: DxEPCTL=0x80008000
[    2.876836] dwc2 12480000.hsotg: dwc2_hsotg_start_req: DXEPCTL=0x80008000
[    2.876847] dwc2 12480000.hsotg: EP0: DIEPCTL0=0x00008000,
DOEPCTL0=0x80008000
[    2.877402] dwc2 12480000.hsotg: dwc2_hsotg_irq: 04001020 00001000
(d88c3cc4) retry 8
[    2.877420] dwc2 12480000.hsotg: dwc2_hsotg_irq: USBRst
[    2.877430] dwc2 12480000.hsotg: GNPTXSTS=00080300

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
