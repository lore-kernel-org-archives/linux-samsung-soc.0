From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 0/3] ARM: dts: add the support of Exynos3250-based Monk
 board
Date: Thu, 27 Nov 2014 02:49:40 +0900
Message-ID: <547612B4.8000909@kernel.org>
References: <1416826670-29438-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416826670-29438-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11/24/14 19:57, Chanwoo Choi wrote:
> This patchset adds the support of Exynos3250-based Monk board and Exynos-based
> boards compatible string and description to remove build warning. Also, this
> patchset includes a patch which remove unused dt node for command line in
> Exynos3250-based Rinato dts file.
> 
> Changes from v2:
> - Include new patches by Chanwoo Choi with following patch[1]
>   [1] http://www.spinics.net/lists/arm-kernel/msg368443.html
> 
> Changes from v1:
> - Fix minor issue
> 
> Chanwoo Choi (2):
>   ARM: exynos: Add Exynos-based boards compatible string and description
>   ARM: dts: Remove unused command line from Exynos3250-based Rinato board
> 
> Youngjun Cho (1):
>   ARM: dts: add board dts file for Exynos3250-based Monk board
> 
>  .../devicetree/bindings/arm/samsung-boards.txt     |  19 +-
>  arch/arm/boot/dts/Makefile                         |   3 +-
>  arch/arm/boot/dts/exynos3250-monk.dts              | 579 +++++++++++++++++++++
>  arch/arm/boot/dts/exynos3250-rinato.dts            |   4 -
>  4 files changed, 595 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos3250-monk.dts
> 
Applied, thanks.

- Kukjin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
