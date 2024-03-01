Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8D20D3CF7C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Mar 2024 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709324903; cv=none; b=BhCe4zmQkt8RNJA/Qg4xtiwQNkMReuNd/Cog5IBllMnxpW++tDWmkcAw8yL9HApjndQ4HB93ufpkc90A40iUHDHHCveu8vIDiqXsB+mvNc2f0U73WWmAgWkd2aFU9yHu5ZvairQnwYwfS6Tdk+EU2rylpV+0yWfmD2dqtFGFAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709324903; c=relaxed/simple;
	bh=EBfTrXbaVw8O69nDsibgHGIoJmqZhM54EJbwk5vcvOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl7Ez4QicGPV0+1LvV6f3E3TOloPWb0Bw34YWEojpz9AYg5wf44qcgZ5hMWCktSQtc913FAXi3t9Tl7m/bEyp+3bClQxWPaBNK0mtl1X5uiAy2Uxdu49hvjutPjEXKb02VKLX0vS3ucoGN+5XRPkL4f8XyK1hzdxZV4eP/XO3QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 45460 invoked by uid 1000); 1 Mar 2024 15:28:19 -0500
Date: Fri, 1 Mar 2024 15:28:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
  Alim Akhtar <alim.akhtar@samsung.com>, linux-usb@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] usb: ehci-exynos: Switch from CONFIG_PM guards to
 pm_ptr()
Message-ID: <f989a532-a77e-4324-902b-968b12134f15@rowland.harvard.edu>
References: <20240301193831.3346-1-linux.amoon@gmail.com>
 <20240301193831.3346-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301193831.3346-3-linux.amoon@gmail.com>

On Sat, Mar 02, 2024 at 01:08:09AM +0530, Anand Moon wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM are disabled,
> without having to use #ifdef guards. If CONFIG_PM unused,
> they will simply be discarded by the compiler.
> 
> Use RUNTIME_PM_OPS runtime macro for suspend/resume function.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 05aa3d9c2a3b..4676f45655cd 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -234,7 +234,6 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>  	usb_put_hcd(hcd);
>  }
>  
> -#ifdef CONFIG_PM
>  static int exynos_ehci_suspend(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
> @@ -268,14 +267,9 @@ static int exynos_ehci_resume(struct device *dev)
>  	ehci_resume(hcd, false);
>  	return 0;
>  }
> -#else
> -#define exynos_ehci_suspend	NULL
> -#define exynos_ehci_resume	NULL
> -#endif

Doesn't this now generate warnings about functions being defined but not 
used when you build with CONFIG_PM disabled?

Alan Stern

>  
>  static const struct dev_pm_ops exynos_ehci_pm_ops = {
> -	.suspend	= exynos_ehci_suspend,
> -	.resume		= exynos_ehci_resume,
> +	RUNTIME_PM_OPS(exynos_ehci_suspend, exynos_ehci_resume, NULL)
>  };
>  
>  #ifdef CONFIG_OF
> @@ -292,7 +286,7 @@ static struct platform_driver exynos_ehci_driver = {
>  	.shutdown	= usb_hcd_platform_shutdown,
>  	.driver = {
>  		.name	= "exynos-ehci",
> -		.pm	= &exynos_ehci_pm_ops,
> +		.pm	= pm_ptr(&exynos_ehci_pm_ops),
>  		.of_match_table = of_match_ptr(exynos_ehci_match),
>  	}
>  };
> -- 
> 2.43.0
> 
