From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/8] rtc: max77686: Extend driver and add max77802 support
Date: Thu, 21 Jan 2016 09:34:25 +0900
Message-ID: <56A02791.9010409@samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <20160121003047.GF3367@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20160121003047.GF3367@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 21.01.2016 09:30, Alexandre Belloni wrote:
>> I believe all patches should go through the RTC tree with proper acks or
>> wait until the RTC patches land to pick the defconfig changes.
>>
> 
> I think Olof would prefer the last patches to go through arm-soc.

That would be preferred but merging them before the 5/8 would cause a
loss of functionality on these defconfigs making it non-bisectable
approach. I think it would be good to preserve bisectability in that
matter so either:
1. a tag from RTC on top of which these patches would be applied in arm-soc,
2. take them to RTC tree with our acks.

Best regards,
Krzysztof
