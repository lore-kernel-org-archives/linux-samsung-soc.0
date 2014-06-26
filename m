From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: Do not calculate boot address twice
Date: Thu, 26 Jun 2014 17:21:45 +0530
Message-ID: <CAK5sBcGdYZRdOK7nDhGFn=TTsFmmp2ReajA+0o5w9u6WxSDR9A@mail.gmail.com>
References: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403783163-28638-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Jun 26, 2014 at 5:16 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Commit b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT
> bindings") introduced local variable boot_reg where boot address from
> cpu_boot_reg() call is stored. Re-use it instead calling cpu_boot_reg()
> again.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Thanks for the patch.
Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>

Regards,
Sachin.
