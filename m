From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] dma: pl330: assign a new cookie when restarting tx
 descriptors in cyclic mode
Date: Sat, 5 May 2012 12:50:30 -0700
Message-ID: <CAJuYYwRecbOgkegB4BcY_JUqtW9vW2FPk+Yz1YfkrRxyGxHVPA@mail.gmail.com>
References: <1336092630-20627-1-git-send-email-thomas.abraham@linaro.org>
 <1336103059.1593.28.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1336103059.1593.28.camel@vkoul-udesk3>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: rmk+kernel@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 3 May 2012 20:44, Vinod Koul <vinod.koul@linux.intel.com> wrote:
> On Thu, 2012-05-03 at 17:50 -0700, Thomas Abraham wrote:
>> The cookie of completed transfer descriptors are marked as zero. In case=
 of
>> cyclic transfers, a new cookie needs to be assigned to the transfer desc=
riptors
>> which are picked up from the work_list list before they are re-enabled f=
or
>> transfer. This prevents hitting BUG_ON in dma_cookie_complete function w=
hen
>> transfer descriptors are recycled from the work_list list.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0drivers/dma/pl330.c | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index 2ee6e23..7f8f422 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -2265,6 +2265,7 @@ static inline void handle_cyclic_desc_list(struct =
list_head *list)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_async_tx_callback callback;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Change status to reload it */
>> + =A0 =A0 =A0 =A0 =A0 =A0 dma_cookie_assign(&desc->txd);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 desc->status =3D PREP;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pch =3D desc->pchan;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 callback =3D desc->txd.callback;
> Nope, this doesn't seem correct to me for two reasons:
> 1. client doesnt know this new descriptor, so how will it keep track
> 2. What does marking cyclic descriptor complete mean... Nothing IMO
>
> So it is better *NOT* to mark the descriptor complete.
> And below is a better fix this for you, Please test.

Ok.

>
> ----------
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 2ee6e23..fa3fb21 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2322,7 +2322,8 @@ static void pl330_tasklet(unsigned long data)
> =A0 =A0 =A0 =A0/* Pick up ripe tomatoes */
> =A0 =A0 =A0 =A0list_for_each_entry_safe(desc, _dt, &pch->work_list, node)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (desc->status =3D=3D DONE) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cookie_complete(&desc->=
txd);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pch->cyclic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_cookie_=
complete(&desc->txd);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0list_move_tail(&desc->node=
, &list);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
>
> --
> ~Vinod
>

I have tested this patch. You can add:
Tested-by: Thomas Abraham <thomas.abraham@linaro.org>

Thanks,
Thomas.
