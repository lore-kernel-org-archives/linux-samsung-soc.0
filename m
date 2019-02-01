From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: sec-core: Return gracefully instead of BUG() if
 device cannot match
Date: Fri, 1 Feb 2019 09:22:07 +0000
Message-ID: <20190201092207.GF783@dell>
References: <1548761153-28114-1-git-send-email-krzk@kernel.org>
 <1548761153-28114-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548761153-28114-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 29 Jan 2019, Krzysztof Kozlowski wrote:

> Replace impossible BUG() in probe with a proper return.  This can be
> triggered only in case of a clear bug (e.g. adding broken half-support
> for new S2MPSXX flavor) but BUG() is discouraged and the boot process
> can actually try to continue.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/sec-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
