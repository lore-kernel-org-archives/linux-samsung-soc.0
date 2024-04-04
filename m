Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B4EC9130A69
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712255200; cv=none; b=TalOvVh0Dt8551b3pilFifZ4gdC+rvujXi+hSl5HNMUV+8CyilerJ/JEJjprQ6GsDXCXJz0eHMt6PI5PD6ypQ2YjKBuG5kDZh1kSIyES2jtqnguWShts8SP3Aywm/k6bHvNZJNF0kdCZ/h5mo+A2v8eEhrfJhqmYrcKQzP+wvI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712255200; c=relaxed/simple;
	bh=jqYMRm7SAbbfCk4uBDe4qlaTk6tIsW2QffwttJ6sznU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3If8iAer/CFiB0uA6mCiCTrMA09Amcl7drffQE+0I4xZlQQ5g72ZJvrNVoy0oSo9Uh15pk9HaNAtbGdX1e7QmshDAXZavJCJxlbRW1XPbZT9y7BuMBN3zRnqvUv2HXp0+fsnhiSEReeHSIUhWPK6Nie7rJg4QNrwiOpqT6bHpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 15729 invoked by uid 1000); 4 Apr 2024 14:26:32 -0400
Date: Thu, 4 Apr 2024 14:26:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
  Alim Akhtar <alim.akhtar@samsung.com>,
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
  Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] usb: ehci-exynos: Switch from CONFIG_PM guards to
 pm_ptr()
Message-ID: <3c3ddbb2-142b-4b3d-a5af-5188f46f0a77@rowland.harvard.edu>
References: <20240404071350.4242-1-linux.amoon@gmail.com>
 <20240404071350.4242-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404071350.4242-3-linux.amoon@gmail.com>

On Thu, Apr 04, 2024 at 12:43:18PM +0530, Anand Moon wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM are disabled,
> without having to use #ifdef guards. If CONFIG_PM unused,
> they will simply be discarded by the compiler.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: add __maybe_unused to suspend/resume functions in case CONFIG_PM is
> disabled.
>     dropped RUNTIME_PM_OPS
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-exynos.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index f00bfd0b13dc..4cfde1af32be 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -236,8 +236,7 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>  	usb_put_hcd(hcd);
>  }
>  
> -#ifdef CONFIG_PM
> -static int exynos_ehci_suspend(struct device *dev)
> +static int __maybe_unused exynos_ehci_suspend(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
> @@ -256,7 +255,7 @@ static int exynos_ehci_suspend(struct device *dev)
>  	return rc;
>  }
>  
> -static int exynos_ehci_resume(struct device *dev)
> +static int __maybe_unused exynos_ehci_resume(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
> @@ -279,10 +278,6 @@ static int exynos_ehci_resume(struct device *dev)
>  	ehci_resume(hcd, false);
>  	return 0;
>  }
> -#else
> -#define exynos_ehci_suspend	NULL
> -#define exynos_ehci_resume	NULL
> -#endif
>  
>  static const struct dev_pm_ops exynos_ehci_pm_ops = {
>  	.suspend	= exynos_ehci_suspend,
> @@ -303,7 +298,7 @@ static struct platform_driver exynos_ehci_driver = {
>  	.shutdown	= usb_hcd_platform_shutdown,
>  	.driver = {
>  		.name	= "exynos-ehci",
> -		.pm	= &exynos_ehci_pm_ops,
> +		.pm	= pm_ptr(&exynos_ehci_pm_ops),
>  		.of_match_table = of_match_ptr(exynos_ehci_match),
>  	}
>  };
> -- 
> 2.44.0
> 
