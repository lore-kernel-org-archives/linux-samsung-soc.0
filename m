From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH V2 1/1] dmaengine/amba-pl08x: Add support for s3c64xx DMAC
Date: Wed, 28 Sep 2011 14:20:24 +0530
Message-ID: <CAGOxZ53qZy+VUM65oK68W088QR=RgQ=cNxOCbO7_WESJesJaVQ@mail.gmail.com>
References: <1317189007-23033-1-git-send-email-alim.akhtar@samsung.com>
 <1317189007-23033-2-git-send-email-alim.akhtar@samsung.com> <4E82D0A1.8050203@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61637 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940Ab1I1IvF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 04:51:05 -0400
In-Reply-To: <4E82D0A1.8050203@st.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Viresh,

Thanks for reviewing the patch.

On Wed, Sep 28, 2011 at 1:15 PM, Viresh Kumar <viresh.kumar@st.com> wro=
te:
> On 9/28/2011 11:20 AM, Alim Akhtar wrote:
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>> =A0drivers/dma/amba-pl08x.c | =A0135 +++++++++++++++++++++++++++++++=
+++++++--------
>> =A01 files changed, 112 insertions(+), 23 deletions(-)
>>
>
> It would be good if you can add pick some part from cover-letter and =
put it in
> commit log too.
>
Ok, I will write more comments in the commit log.

>> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
>> index cd8df7f..501540f 100644
>> --- a/drivers/dma/amba-pl08x.c
>> +++ b/drivers/dma/amba-pl08x.c
>> @@ -110,6 +129,11 @@ struct pl08x_lli {
>> =A0 =A0 =A0 u32 dst;
>> =A0 =A0 =A0 u32 lli;
>> =A0 =A0 =A0 u32 cctl;
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Samsung pl080 DMAC has one exrta control register
>> + =A0 =A0 =A0* which is used to hold the transfer_size
>> + =A0 =A0 =A0*/
>> + =A0 =A0 u32 cctl1;
>
> Will you write transfer_size in cctl also? What is the purpose of cct=
l1?
>
The main difference between Primecell PL080 and samsung variant is in
LLI control register bit [0:11] is reserved in case of samsung pl080
and one extra register is add to hold the transfer size at offset
0x10. The purpose of cctl1 is store the transfer_size.

>> @@ -215,11 +255,23 @@ static void pl08x_start_txd(struct pl08x_dma_c=
han *plchan,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_relax();
>>
>> =A0 =A0 =A0 /* Do not access config register until channel shows as =
inactive */
>> - =A0 =A0 val =3D readl(phychan->base + PL080_CH_CONFIG);
>> - =A0 =A0 while ((val & PL080_CONFIG_ACTIVE) || (val & PL080_CONFIG_=
ENABLE))
>> + =A0 =A0 if (pl08x->vd->is_pl080_s3c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->base + PL080S_CH_CO=
NFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CONFIG_ACTIVE) ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val & PL080_CONFIG_ENABLE=
))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->bas=
e + PL080S_CH_CONFIG);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080S_CH_=
CONFIG);
>> + =A0 =A0 } else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D readl(phychan->base + PL080_CH_C=
ONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while ((val & PL080_CONFIG=
_ACTIVE) ||
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val & PL0=
80_CONFIG_ENABLE))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D re=
adl(phychan->base + PL080_CH_CONFIG);
>>
>> - =A0 =A0 writel(val | PL080_CONFIG_ENABLE, phychan->base + PL080_CH=
_CONFIG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 writel(val | PL080_CONFIG_ENABLE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phychan->base + PL080_CH_C=
ONFIG);
>> + =A0 =A0 }
>
> You have similar stuff in most the the changes in this patch, because=
 offset of
> config register changes for s3c, you placed in if,else block.
>
> If you check these changes again, there is a lot of code duplication =
in this if,else
> blocks. The only different thing in if,else is the offset of CH_CONFI=
G register.
>
> It would be much better if you can do following:
>
> u32 ch_cfg_off;
>
> =A0 =A0 =A0 =A0if (pl08x->vd->is_pl080_s3c)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ch_cfg_off =3D PL080S_CH_CONFIG;
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ch_cfg_off =3D PL080_CH_CONFIG;
>
> Now, this offset can be used in existing code, without much code dupl=
ication.
>
I will use suggestion and remove the code duplications.

>> @@ -569,6 +641,7 @@ static int pl08x_fill_llis_for_desc(struct pl08x=
_driver_data *pl08x,
>> =A0 =A0 =A0 u32 cctl, early_bytes =3D 0;
>> =A0 =A0 =A0 size_t max_bytes_per_lli, total_bytes =3D 0;
>> =A0 =A0 =A0 struct pl08x_lli *llis_va;
>> + =A0 =A0 size_t lli_len =3D 0, target_len, tsize, odd_bytes;
>>
>> =A0 =A0 =A0 txd->llis_va =3D dma_pool_alloc(pl08x->pool, GFP_NOWAIT,=
 &txd->llis_bus);
>> =A0 =A0 =A0 if (!txd->llis_va) {
>> @@ -700,7 +773,7 @@ static int pl08x_fill_llis_for_desc(struct pl08x=
_driver_data *pl08x,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* width left
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (bd.remainder > (mbus->buswidth - =
1)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t lli_len, tsize, wid=
th;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size_t width;
>>
>
> why do we need above two changes. odd_bytes and target_len are still =
unused.
>
sorry, I will remove the used variables.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If enough left try =
to send max possible,
>> @@ -759,6 +832,9 @@ static int pl08x_fill_llis_for_desc(struct pl08x=
_driver_data *pl08x,
>> =A0 =A0 =A0 llis_va[num_llis - 1].lli =3D 0;
>> =A0 =A0 =A0 /* The final LLI element shall also fire an interrupt. *=
/
>> =A0 =A0 =A0 llis_va[num_llis - 1].cctl |=3D PL080_CONTROL_TC_IRQ_EN;
>> + =A0 =A0 /* Keep the TransferSize seperate to fill samsung specific=
 register */
>> + =A0 =A0 if (pl08x->vd->is_pl080_s3c)
>> + =A0 =A0 =A0 =A0 =A0 =A0 llis_va[num_llis - 1].cctl1 |=3D lli_len;
>
> I couldn't get this completely. Why do you keep only length of
> last lli in cctl1. what about all other llis. Also why |=3D
> and not directly cctl1 =3D lli_len
>
I will write more explanation about it.
> --
> viresh
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
