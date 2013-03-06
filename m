From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Wed, 06 Mar 2013 22:20:38 +0100
Message-ID: <5137B326.3040404@gmail.com>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org> <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org> <5133A068.7060906@gmail.com> <CAD025yQA+yAPzATDvE-4HQP+HVbmDQkg+XVKd=VUepL+dM9s9Q@mail.gmail.com> <5137B183.6040201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:60821 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755443Ab3CFVUm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 16:20:42 -0500
Received: by mail-wi0-f173.google.com with SMTP id hq4so467259wib.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 13:20:41 -0800 (PST)
In-Reply-To: <5137B183.6040201@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sunil joshi <joshi@samsung.com>

On 03/06/2013 10:13 PM, Sylwester Nawrocki wrote:
> @@ -305,9 +305,9 @@ struct platform_device s5p_device_jpeg = {
>   #ifdef CONFIG_S5P_DEV_FIMD0
>   static struct resource s5p_fimd0_resource[] = {
>          [0] = DEFINE_RES_MEM(S5P_PA_FIMD0, SZ_32K),
> -       [1] = DEFINE_RES_IRQ(IRQ_FIMD0_VSYNC),
> -       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO),
> -       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM),
> +       [1] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_VSYNC, "vsync"),
> +       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO, "fifo"),
> +       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM, "system"),
>   };

Oops, something missing here. Of course should be:

@@ -160,9 +160,9 @@ struct platform_device samsung_asoc_idma = {
  #ifdef CONFIG_S3C_DEV_FB
  static struct resource s3c_fb_resource[] = {
         [0] = DEFINE_RES_MEM(S3C_PA_FB, SZ_16K),
-       [1] = DEFINE_RES_IRQ(IRQ_LCD_VSYNC),
-       [2] = DEFINE_RES_IRQ(IRQ_LCD_FIFO),
-       [3] = DEFINE_RES_IRQ(IRQ_LCD_SYSTEM),
+       [1] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_VSYNC, "vsync"),
+       [2] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_FIFO, "fifo"),
+       [3] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_SYSTEM, "system"),
