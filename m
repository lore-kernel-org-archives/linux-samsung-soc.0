From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] [media] media: rename media unregister function
Date: Fri, 18 Mar 2016 10:48:13 -0300
Message-ID: <56EC071D.5060400@osg.samsung.com>
References: <2ffc02c944068b2c8655727238d1542f8328385d.1458306276.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54483 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754589AbcCRNsh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 09:48:37 -0400
In-Reply-To: <2ffc02c944068b2c8655727238d1542f8328385d.1458306276.git.mchehab@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Antti Palosaari <crope@iki.fi>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Junghak Sung <jh1009.sung@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Geunyoung Kim <nenggun.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Shuah

Hello Mauro,

On 03/18/2016 10:05 AM, Mauro Carvalho Chehab wrote:
> Now that media_device_unregister() also does a cleanup, rename it
> to media_device_unregister_cleanup().
>

I believe there should be a Suggested-by Sakari Ailus tag here.
 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

The patch looks good and I agree that makes things more clear.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
