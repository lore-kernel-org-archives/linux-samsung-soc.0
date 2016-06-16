From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RESEND RFT PATCH 2/2] mfd: max14577: Allow driver to be built as
 a module
Date: Thu, 16 Jun 2016 09:48:44 -0400
Message-ID: <315537c3-a65e-d0bd-c09c-3372880396d7@osg.samsung.com>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
 <1464280340-13228-3-git-send-email-javier@osg.samsung.com>
 <20160616104048.GU4948@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:37973 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752587AbcFPNsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 09:48:52 -0400
In-Reply-To: <20160616104048.GU4948@dell>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

Hello Lee,

On 06/16/2016 06:40 AM, Lee Jones wrote:
> On Thu, 26 May 2016, Javier Martinez Canillas wrote:
> 
>> The driver's Kconfig symbol is a boolean but nothing prevents the driver
>> to be built as a module instead of built-in. It is true that most system
>> integrators will choose the latter but the config should not restrict it.
> 
> Does the driver have all of the module related code?
>

Yes, it always did (even has a MODULE_DEVICE_TABLE so autoload should work)
but is just that the Kconfig symbol was bool instead of tristate since most
system integrators will choose to have it built-in.
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
