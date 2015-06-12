From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2] ARM: dts: fix the clock-frequency of rinato board's
 panel
Date: Fri, 12 Jun 2015 08:38:42 -0700
Message-ID: <20150612153842.GA12274@kroah.com>
References: <1434103610-24182-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434103610-24182-1-git-send-email-human.hwang@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com, stable@vger.kernel.org, sw0312.kim@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 12, 2015 at 07:06:50PM +0900, Hyungwon Hwang wrote:
> After the commit abc0b1447d4974963548777a5ba4a4457c82c426
> ("drm: Perform basic sanity checks on probed modes"), proper
> clock-frequency becomes mandatory for validating the mode of panel.
> The display does not work if there is no mode validated. Also, this
> clock-frequency must be set appropriately for getting required frame
> rate.
> 
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
