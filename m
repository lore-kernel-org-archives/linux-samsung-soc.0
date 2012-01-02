From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC][PATCH 1/4] lcd: platform-lcd: Eliminate need for platform
 data
Date: Mon, 2 Jan 2012 11:59:59 +0000
Message-ID: <20120102115959.GG2899@opensource.wolfsonmicro.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
 <1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38706 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752316Ab2ABMAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 07:00:04 -0500
Content-Disposition: inline
In-Reply-To: <1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

On Mon, Jan 02, 2012 at 11:24:32AM +0530, Thomas Abraham wrote:

> @@ -10,12 +10,3 @@
>   * published by the Free Software Foundation.
>   *
>  */
> -
> -struct plat_lcd_data;
> -struct fb_info;
> -
> -struct plat_lcd_data {
> -	void	(*set_power)(struct plat_lcd_data *, unsigned int power);
> -	int	(*match_fb)(struct plat_lcd_data *, struct fb_info *);
> -};

This is going to break all existing users as it will stop them compiling
- they'd either need to be converted en masse to the new style as part
of the commit doing this or the driver would need to support both
platform data and new style configuration simultaneously.
