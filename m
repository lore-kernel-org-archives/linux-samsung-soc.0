From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 0/10] Add RK3399 eDP support and fix some bugs to
 analogix_dp driver.
Date: Fri, 27 May 2016 14:16:40 +0800
Message-ID: <5747E648.6020100@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <5746C321.9000707@rock-chips.com>
 <4e1c65f8-5a5b-dbb9-35fe-ef09c0758536@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e1c65f8-5a5b-dbb9-35fe-ef09c0758536@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Javier,

On 05/26/2016 08:48 PM, Javier Martinez Canillas wrote:
> Hello Yakir,
>
> On 05/26/2016 05:34 AM, Yakir Yang wrote:
>> Hi Javier,
>>
>> On 05/24/2016 01:01 PM, Yakir Yang wrote:
>>> Hi all,
>>>
>>> This series have been posted about one month, still no comments, help here :(
>> This series works rightly on Rockchip platform, and most of them haven't touch the
>> common analogix_dp driver (except for the hotplug fixed). So i guess Exynos platform
>> should also happy with this changes.
>>
>> But not sure about that. So, is it possible that you could help to check this on Exynos
>> Chromebook, if so i would be very grateful about that.
>>
> Of course, I' ll test. Could you please provide me a branch that I can
> pull directly to avoid cherry-picking all the patches from the list?
>   
Ah, thanks a lot, I do have a tree 
https://github.com/yakir-Yang/linux/tree/fromlist/3399-edp

- Yakir
>> Thanks,
>> - Yakir
> Best regards,
