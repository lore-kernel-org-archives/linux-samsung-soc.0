Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1082818627
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Mar 2024 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709394620; cv=none; b=A1E76C+UHkwg4UhJUe7qiH6juagfjBaq7UJ2GYeO+gsVKvK9SFwmh+hghPq7H67A5L8cVe3CLFCFb0UotDQ2ZPwnahzg83r1xn76WroPRHzjYwqSBmKTo2Ibvc7AEciLwJMrlVg8kDPfaCI1x8vrPK+VF6i9DSza/JXgLU4Iiq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709394620; c=relaxed/simple;
	bh=KTREv5khEkAsuFrL/84SSfLw3p1IGOJMFIezNKN1ya0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XL2+cyJld+M++VJhOMZT7n5GfnWcE3hTII3UpawH2gVxHcefj0HUNQ/0ebdvdR3+KBCeu1xzAQWTOxigvi2S05BRSzjeBzWLc5+3k5XHSKJ+Hl6tMEdv/6VFsQUBa2Wowzk3YUWc4Hr6ZjZ5a3uBzQe8BH1X53t+yIPE283XjNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kBVfUYpH; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kBVfUYpH"
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id gRbkrY9aBQ6QsgRbkrNO5w; Sat, 02 Mar 2024 16:49:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1709394548;
	bh=OBJwov9xcJAlQrkX9Iw46sbkSp3nIB0hxWjHqTxE+eY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kBVfUYpHBRTLdI8ctarQHnIpXNLw5O6YDhQ+i57cUBINzM2b7U5vWM2WRBt6fmoRV
	 yZOpBV4jBLDrs6k6yWYybfIfSPcAMrXw2ZB6YK/yIQmpByOCdkXIZdjQYK6xJwLqYN
	 NncjytUuJH5VLQXaHFJNAXl6kbLnnbeFG4zk9bKVWw8FpXMV11+nggqs66bAsS/dQy
	 EfO5B8VYtn/3VFECq02vg3jtpk8VtkdufpWwZa2ZqrDVVQhSOLkMbfSiuSWobgkRvK
	 NAdJdG7hm+L7r1TrofAjvfRE/Snt3X4WoJlYYaA1o/blLRqcjlKX2dJ5X8IsJIOkTg
	 EEZ/LvBC74P+g==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Mar 2024 16:49:08 +0100
X-ME-IP: 92.140.202.140
Message-ID: <3d1c7682-d163-4bcf-bd41-d7db0c8f61d1@wanadoo.fr>
Date: Sat, 2 Mar 2024 16:49:02 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] usb: ehci-exynos: Use devm_clk_get_enabled()
 helpers
To: Anand Moon <linux.amoon@gmail.com>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240301193831.3346-1-linux.amoon@gmail.com>
 <20240301193831.3346-2-linux.amoon@gmail.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240301193831.3346-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/03/2024 à 20:38, Anand Moon a écrit :
> The devm_clk_get_enabled() helpers:
>      - call devm_clk_get()
>      - call clk_prepare_enable() and register what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> While at it, use dev_err_probe consistently, and use its return value
> to return the error code.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/usb/host/ehci-exynos.c | 30 +++++-------------------------
>   1 file changed, 5 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index f644b131cc0b..05aa3d9c2a3b 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -159,19 +159,12 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>   
>   	err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
>   	if (err)
> -		goto fail_clk;
> -
> -	exynos_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
> -
> -	if (IS_ERR(exynos_ehci->clk)) {
> -		dev_err(&pdev->dev, "Failed to get usbhost clock\n");
> -		err = PTR_ERR(exynos_ehci->clk);
> -		goto fail_clk;
> -	}
> +		goto fail_io;
>   
> -	err = clk_prepare_enable(exynos_ehci->clk);
> -	if (err)
> -		goto fail_clk;
> +	exynos_ehci->clk = devm_clk_get_enabled(&pdev->dev, "usbhost");
> +	if (IS_ERR(exynos_ehci->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(exynos_ehci->clk),
> +				  "Failed to get usbhost clock\n");
>   
>   	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(hcd->regs)) {
> @@ -223,8 +216,6 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>   	exynos_ehci_phy_disable(&pdev->dev);
>   	pdev->dev.of_node = exynos_ehci->of_node;
>   fail_io:
> -	clk_disable_unprepare(exynos_ehci->clk);
> -fail_clk:
>   	usb_put_hcd(hcd);
>   	return err;
>   }
> @@ -240,8 +231,6 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>   
>   	exynos_ehci_phy_disable(&pdev->dev);
>   
> -	clk_disable_unprepare(exynos_ehci->clk);
> -
>   	usb_put_hcd(hcd);
>   }
>   
> @@ -249,7 +238,6 @@ static void exynos_ehci_remove(struct platform_device *pdev)
>   static int exynos_ehci_suspend(struct device *dev)
>   {
>   	struct usb_hcd *hcd = dev_get_drvdata(dev);
> -	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>   
>   	bool do_wakeup = device_may_wakeup(dev);
>   	int rc;
> @@ -260,25 +248,17 @@ static int exynos_ehci_suspend(struct device *dev)
>   
>   	exynos_ehci_phy_disable(dev);
>   
> -	clk_disable_unprepare(exynos_ehci->clk);

Hi,

I don't think that removing clk_[en|dis]abble from the suspend and 
resume function is correct.

The goal is to stop some hardware when the system is suspended, in order 
to save some power.

Why did you removed it?

CJ

> -
>   	return rc;
>   }
>   
>   static int exynos_ehci_resume(struct device *dev)
>   {
>   	struct usb_hcd *hcd = dev_get_drvdata(dev);
> -	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>   	int ret;
>   
> -	ret = clk_prepare_enable(exynos_ehci->clk);
> -	if (ret)
> -		return ret;
> -
>   	ret = exynos_ehci_phy_enable(dev);
>   	if (ret) {
>   		dev_err(dev, "Failed to enable USB phy\n");
> -		clk_disable_unprepare(exynos_ehci->clk);
>   		return ret;
>   	}
>   

