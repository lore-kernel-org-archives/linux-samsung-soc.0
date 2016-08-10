From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: S3C24XX: Add dma_mask assignments for DMA devices
Date: Wed, 10 Aug 2016 11:23:03 +0200
Message-ID: <CAJKOXPfGceFUtb4Z+E4MSCWNfgtd08U=L+avvXvxNw9X_OkKOQ@mail.gmail.com>
References: <1470304572-14937-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470304572-14937-1-git-send-email-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 4, 2016 at 11:56 AM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> The dma_mask assignments seem to be missed during refactoring
> of arch/arm/mach-s3c24xx. Add them to avoid DMA allocation
> failures. Without this patch sound is broken on s3c24xx
> with errors reported like:
>
> s3c24xx-dma s3c2410-dma.0: coherent DMA mask is unset
> ALSA pcmC0D0p,0:: cannot preallocate for size 524288
> s3c24xx-iis s3c24xx-iis: Failed to get DMA channel capabilities,
> falling back to period counting: -6
> s3c24xx-dma s3c2410-dma.0: coherent DMA mask is unset
> ...
> ALSA pcmC0D0c,0:: cannot preallocate for size 524288
> s3c24xx-iis s3c24xx-iis: Failed to get DMA channel capabilities,
> falling back to period counting: -6
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/mach-s3c24xx/common.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)

Thanks, applied.

BR,
Krzysztof
