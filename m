From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] [media] media: rename media unregister function
Date: Fri, 18 Mar 2016 11:12:20 -0300
Message-ID: <56EC0CC4.1070309@osg.samsung.com>
References: <2ffc02c944068b2c8655727238d1542f8328385d.1458306276.git.mchehab@osg.samsung.com>
 <56EC0A55.3010803@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54563 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932244AbcCROMn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Mar 2016 10:12:43 -0400
In-Reply-To: <56EC0A55.3010803@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Antti Palosaari <crope@iki.fi>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Junghak Sung <jh1009.sung@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Geunyoung Kim <nenggun.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>=?UTF-8?Q

Hello Shuah,

On 03/18/2016 11:01 AM, Shuah Khan wrote:
> On 03/18/2016 07:05 AM, Mauro Carvalho Chehab wrote:
>> Now that media_device_unregister() also does a cleanup, rename it
>> to media_device_unregister_cleanup().
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> 
> I think adding cleanup is redundant. media_device_unregister()
> would imply that there has to be some cleanup releasing resources.
> I wouldn't make this change.
>

Problem is that there is a media_device_init() and media_device_register(),
so having both unregister and cleanup in this function will make very clear
that a single function is the counter part of the previous two operations.
 
> thanks,
> -- Shuah
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
