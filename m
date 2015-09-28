From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-trats2: remove regulator-compatible
 usage
Date: Mon, 28 Sep 2015 12:39:33 +0200
Message-ID: <560918E5.6090108@osg.samsung.com>
References: <1443188657-13501-1-git-send-email-javier@osg.samsung.com>
 <CANAwSgS4uyXYTPWJTkiZ2fQkwXNF+P7Ziuoy6o6jXyEmTw6Ovg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgS4uyXYTPWJTkiZ2fQkwXNF+P7Ziuoy6o6jXyEmTw6Ovg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Anand,

On 09/28/2015 12:10 PM, Anand Moon wrote:
> Hi Javier,
> 

[snip]

>>
>> -                       ldo10_reg: ldo10 {
>> -                               regulator-compatible = "LDO10";
> Missing the node name 'LDO10'
>> +                       ldo10_reg: DO10 {

Thanks for pointing out, I had to look twice to understand what you were
saying. Isn't that the LDO10 is missing but that was mistyped as "DO10".

I posted a v2 fixing it.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
