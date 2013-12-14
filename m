From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: Add missing clocks for exynos4412 dwmmc node
Date: Sat, 14 Dec 2013 14:24:23 +0100
Message-ID: <6057819.pWzq25qpVf@flatron>
References: <1386998490-19456-1-git-send-email-kasimling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386998490-19456-1-git-send-email-kasimling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Ling <kasimling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alex,

On Saturday 14 of December 2013 13:21:30 Alex Ling wrote:
> This patch adds "biu" and "ciu" clocks for exynos4412 dwmmc
> node. Without this patch, dwmmc host driver will skip enabling the
> two clocks and it will break dwmmc host function on exynos4412.
> Tested on FriendlyARM TINY4412 board.
> 
> Signed-off-by: Alex Ling <kasimling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes for v2:
>    - Fix patch description as Mark Rutland suggested
> 
>  arch/arm/boot/dts/exynos4412.dtsi |    2 ++
>  1 file changed, 2 insertions(+)

The patch is correct, but unfortunately it's not the only thing that
is wrong with MSHC device tree node for Exynos4x12.

Please refer to my series fixing DW-MSHC support on Exynos4x12 (and
enabling it on TRATS2 board):
http://www.spinics.net/lists/arm-kernel/msg293652.html

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
