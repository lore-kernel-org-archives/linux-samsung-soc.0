From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] [media] media: rename media unregister function
Date: Fri, 18 Mar 2016 16:20:19 +0200
Message-ID: <56EC0EA3.6010108@linux.intel.com>
References: <2ffc02c944068b2c8655727238d1542f8328385d.1458306276.git.mchehab@osg.samsung.com>
 <56EC0A55.3010803@osg.samsung.com> <56EC0CC4.1070309@osg.samsung.com>
 <56EC0DF9.4050601@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <56EC0DF9.4050601@osg.samsung.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, alsa-devel@alsa-project.org, =?UTF-8?Q?Rafael_Louren=c3=a7o_de_Lima_Chehab?= <chehabrafael@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Matthias Schwarzott <zzam@gentoo.org>, devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org, Patrick Boettcher <patrick.boettcher@posteo.de>, Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>, Hans Verkuil <hans.verkuil@cisco.com>, linux-arm-kernel@lists.infradead.org, Luis de Bethencourt <luis@debethencourt.com>, Junghak Sung <jh1009.sung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@infradead.org>, Inki Dae <inki.dae@samsung.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Geunyoung Kim <nenggun.kim@samsung.com>, Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?S=c3=b6ren_Bri
List-Id: linux-samsung-soc@vger.kernel.org

Shuah Khan wrote:
> On 03/18/2016 08:12 AM, Javier Martinez Canillas wrote:
>> Hello Shuah,
>>
>> On 03/18/2016 11:01 AM, Shuah Khan wrote:
>>> On 03/18/2016 07:05 AM, Mauro Carvalho Chehab wrote:
>>>> Now that media_device_unregister() also does a cleanup, rename it
>>>> to media_device_unregister_cleanup().
>>>>
>>>> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
>>>
>>> I think adding cleanup is redundant. media_device_unregister()
>>> would imply that there has to be some cleanup releasing resources.
>>> I wouldn't make this change.
>>>
>>
>> Problem is that there is a media_device_init() and media_device_register(),
>> so having both unregister and cleanup in this function will make very clear
>> that a single function is the counter part of the previous two operations.
>>  
> 
> Yes. I realized that this change is motivated by the fact that there is
> the media_device_init() and we had the counterpart media_device_cleanup()
> as an exported function. I still think there is no need to make the change
> to add _cleanup() at the end of media_device_unregister(). It can be handled
> in API documentation that it does both.

I think that's a bad idea. People will only read the documentation when
something doesn't work. In this case it's easy to miss that.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
