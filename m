From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet
 driver for Odroid-XU4
Date: Fri, 9 Oct 2015 16:22:03 +0530
Message-ID: <CANAwSgQMFARyTvf4gBoWTqknYQLs2z=6KyKud07vwfHLAQ_0Wg@mail.gmail.com>
References: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
 <5551783.9EQ5GEjhxX@wuerfel> <1444384745.9895.265.camel@collabora.co.uk>
 <5276113.A7SSumyVrv@wuerfel> <56179B33.9030803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56179B33.9030803@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Linux Kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 9 October 2015 at 16:17, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> W dniu 09.10.2015 o 19:28, Arnd Bergmann pisze:
>> On Friday 09 October 2015 11:59:05 Sjoerd Simons wrote:
>>>
>>>> I realize that building things as modules is a hassle, it is so for
>>>> some things more than for others, so I keep asking the question
>>>> to everyone to find out what a good balance is to make as much as
>>>> possible modules without hurting too much.
>>>
>>> Fwiw, I don't find building modules overly cumbersome. Getting an
>>> initramfs capable of moving on to an NFS root is mostly a one-time
>>> thing (not unlike setting up the nfs root itself) and injecting modules
>>> into it is relatively simple (doubly so if taking advantage of the
>>> multiple cpio archive feature linux has).
>>>
>>> Interestingly, for me not building things as modules in multi_v7 tends
>>> to cause more work as it hides a few categories of bugs that tend to
>>> crop up once building distro kernels (e.g. missing module aliases,
>>> missing module device table entries, implicitly relying on clocks being
>>> active during probe as unused clocks only get turned of late in the
>>> init sequence etc).
>>>
>>
>> Ok, let's try to make all future network drivers modules in the
>> multi_v7_defconfig then, and get people to use an initramfs
>> if they need NFS root. If nobody complains too loudly for the
>> next few releases, we can change the existing drivers to =m as well.
>
> Personally I don't use NFS root and we don't have such configurations at
> work. At least I am not aware of such. So from my point of view network
> adapters as module is okay.
>
> Anand,
> Can you change it in multi_v7 patch to module?
>
> Best regards,
> Krzysztof

Yes I will change this to build as module for multi_v7, and resend the patch.

-Anand Moon
