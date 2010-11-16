From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 2/2] h1940-leds: Fix compile issue introduced by latch-related
 changes
Date: Tue, 16 Nov 2010 23:12:58 +0000
Message-ID: <4CE30FFA.7000204@fluff.org>
References: <1289248308-21272-1-git-send-email-anarsoul@gmail.com> <1289248308-21272-2-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:58124 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S932586Ab0KPXNF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 18:13:05 -0500
In-Reply-To: <1289248308-21272-2-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>

On 08/11/10 20:31, Vasily Khoruzhick wrote:
> Latch API was converted to gpiolib API as result we got this compile
> error:
> 
> drivers/leds/leds-h1940.c: In function 'h1940_greenled_set':
> drivers/leds/leds-h1940.c:33: error: implicit declaration of function
> 'h1940_latch_control
> 
> Adapt h1940-leds driver to new changes and fix compile issue.
> 

it's a pitty we can't remove the driver totally and use the
gpio leds.
