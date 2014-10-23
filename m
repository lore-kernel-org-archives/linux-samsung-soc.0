From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 4/5] regulator: max77802: Parse regulator operating mode properties
Date: Thu, 23 Oct 2014 11:28:09 +0200
Message-ID: <0DA944C5-7A6B-461B-A8E6-D47343D22E0B@collabora.co.uk>
References: <1413816472-1895-1-git-send-email-javier.martinez@collabora.co.uk> <1413816472-1895-5-git-send-email-javier.martinez@collabora.co.uk> <20141022164813.GD2344@sirena.org.uk>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141022164813.GD2344@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

> On 22/10/2014, at 18:48, Mark Brown <broonie@kernel.org> wrote:
> 
>> On Mon, Oct 20, 2014 at 04:47:51PM +0200, Javier Martinez Canillas wrote:
>> 
>> +    char *states[PM_SUSPEND_MAX + 1] = {
>> +        [PM_SUSPEND_MEM] = "regulator-state-mem",
>> +        [PM_SUSPEND_MAX] = "regulator-state-disk",
>> +    };
> 
> This still has the same problem as your previous patch with things not
> being as joined up with the core as they should be.  What I'd like to
> see is that the code to extract the number for each state is in the core
> and then the drivers just provide a translation function to map from
> this to the internal modes.

Ok, I'll send a new version parsing it in the core and providing a translation function in the driver as you said.

However this is an implementation detail and should not change the DT bindings in the current version. Could you please let me know if you have any issues with the other patches from this series so I can address all of them when doing a re-spin?

Thanks a lot and best regards,
Javier