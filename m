From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: Who is going to merge it [Was: Re: [PATCH v14 0/17] Add Analogix
 Core Display Port Driver]
Date: Thu, 24 Mar 2016 11:11:08 +0000 (UTC)
Message-ID: <5A08F152.40705__7631.99678990549$1458817868$gmane$org@rock-chips.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>	<1919945.Y1tg0YzXlm@diego>	<56F1CAEB.3080701@samsung.com>	<8949624.HmxDpZAlt2@diego>	<56F1D0AD.8030905@samsung.com>	<20160322233906.GP19428@n2100.arm.linux.org.uk>	<56F1DB27.4040001@samsung.com>	<20160323000835.GQ19428@n2100.arm.linux.org.uk>
 <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Date: Sun, 12 Nov 2017 20:11:46 -0500
In-Reply-To: <CAPM=9tz9_rbGJFuv-+YN=Sicfng++tHTDLrOX5Ohtwft+VnwtA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Airlie <airlied@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, Daniel Kurtz <djkurtz@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robherring2@gmail.com>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetr>
List-Id: linux-samsung-soc@vger.kernel.org


On 03/22/2016 08:41 PM, Dave Airlie wrote:
>>> So although it's small framework or just subdirectory, we would need
>>> someone who can manage the framework to avoid further confusion if
>>> necessary.
>> So maybe it just doesn't need a maintainer, and maybe those the owner
>> of the bridge driver should be responsible for choosing the tree which
>> it's merged through along with updates.  That's how dw-hdmi has been
>> managed on the whole.
>>
>> It also means that the bridge driver maintainer is able to test changes
>> to the bridge driver, rather than having some over-arching bridge
>> subdirectory maintainer who doesn't have a clue whether the changes
>> work on the hardware.
>>
>> IMHO, having bridge driver authors/maintainers look after their own
>> code has many advantages.
> The author just send me a pull request with acks from a git tree
> that hopefully both people agreed and tested from. No need to
> send this via another maintainer layer.
>
> Dave.
>

Wow, thanks all ! such cool news  :-D  I'll prepare my pull request soon


- Yakir
