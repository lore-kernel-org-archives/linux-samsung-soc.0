From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: exynos5433: add DECON_TV node
Date: Tue, 10 Jan 2017 19:11:14 +0200
Message-ID: <20170110171114.unajua37bbosxuey@kozik-lap>
References: <CGME20170110082433eucas1p2f7cb7b0974987e2c8294509960468fd3@eucas1p2.samsung.com>
 <1484036664-15951-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484036664-15951-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 10, 2017 at 09:24:22AM +0100, Andrzej Hajda wrote:
> DECON_TV is 2nd display controller on Exynos5433, used in HDMI path
> or 2nd DSI path.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Tested-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> Hi Krzysztof,
> 
> These patches are based on latest patches separating tm2 and tm2e and
> touchscreen patches. I hope this is good base.
> Thanks all for quick response/review.
>

Thanks for fixing the issues. Also thank you for trying to fix the
subject. However this is not a full fix. Please run:
$ git log --oneline arch/arm64/boot/dts/exynos/

Why I am asking about this? I am trying to have it consistent so
going through history would be easier. Of course we might discuss what
prefix should be used. Some other platforms use "arm64: dts:
architecture:", some use "arm64: dts: specific_chip_family:". For exynos
we are trying to keep it just "exynos". Anyway regardless of the chosen
prefix itself, after choosing some pattern, the consistency helps.

When people keep sending patches with wrong title, then after every
git-am I have to amend the commit and fix it. It is not difficult but
annoying.

Actually before I did not complain about it... but recently (this cycle)
a lot of Samsung folks are sending wrong subjects. Weird.

So just use the command and look at history.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
