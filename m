Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2746F1304B7
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712255228; cv=none; b=a01EXmpmVKgVq+lLSgQpg9zUPRiJTKNs1ocLlr+i/j8dnK+kwxQ4qqMfq78xrgmYVOVdt1KREHD/0JE4rwDRqB9GyLXkmy5HLH6eUhSktigpA61Q7CiJDHGceLOvjViq5HWImgJgtkotR+sL+JpyiNaBomowC7s7YyVhnFEcjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712255228; c=relaxed/simple;
	bh=I6jRZ854ecCgWY95SZlS6zIp0tbz6PMCpLeBKuhM+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8YrHVi2A4e25m2Jy+rdlHE9x7q/cn3GeqMLVY28wrdcXIH1WwL+rZ0ol30j6LYQWwNlLwnML18bbWTGUvcM/6uXjRbluXtzkQAOZYfjwXR6tJA5pvxN1CmFweq4KsipjgD6KkO14PFmCiOakymtutmKPpMT/0tDDNN3qTCHEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 15760 invoked by uid 1000); 4 Apr 2024 14:27:06 -0400
Date: Thu, 4 Apr 2024 14:27:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
  Alim Akhtar <alim.akhtar@samsung.com>,
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
  Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: ohci-exynos: Switch from CONFIG_PM guards to
 pm_ptr()
Message-ID: <6a29e005-8a35-46be-bfe5-57818b02af16@rowland.harvard.edu>
References: <20240404071350.4242-1-linux.amoon@gmail.com>
 <20240404071350.4242-5-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404071350.4242-5-linux.amoon@gmail.com>

On Thu, Apr 04, 2024 at 12:43:20PM +0530, Anand Moon wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM are disabled,
> without having to use #ifdef guards. If CONFIG_PM unused,
> they will simply be discarded by the compiler.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: new changes in this series.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-exynos.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index 85d04ae0ae40..3e647e0b341d 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -212,8 +212,7 @@ static void exynos_ohci_shutdown(struct platform_device *pdev)
>  		hcd->driver->shutdown(hcd);
>  }
>  
> -#ifdef CONFIG_PM
> -static int exynos_ohci_suspend(struct device *dev)
> +static int __maybe_unused exynos_ohci_suspend(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
> @@ -230,7 +229,7 @@ static int exynos_ohci_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int exynos_ohci_resume(struct device *dev)
> +static int __maybe_unused exynos_ohci_resume(struct device *dev)
>  {
>  	struct usb_hcd *hcd			= dev_get_drvdata(dev);
>  	struct exynos_ohci_hcd *exynos_ohci	= to_exynos_ohci(hcd);
> @@ -249,10 +248,6 @@ static int exynos_ohci_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#else
> -#define exynos_ohci_suspend	NULL
> -#define exynos_ohci_resume	NULL
> -#endif
>  
>  static const struct ohci_driver_overrides exynos_overrides __initconst = {
>  	.extra_priv_size =	sizeof(struct exynos_ohci_hcd),
> @@ -277,7 +272,7 @@ static struct platform_driver exynos_ohci_driver = {
>  	.shutdown	= exynos_ohci_shutdown,
>  	.driver = {
>  		.name	= "exynos-ohci",
> -		.pm	= &exynos_ohci_pm_ops,
> +		.pm	= pm_ptr(&exynos_ohci_pm_ops),
>  		.of_match_table	= of_match_ptr(exynos_ohci_match),
>  	}
>  };
> -- 
> 2.44.0
> 
