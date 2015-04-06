From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [GIT PULL 2/5] Samsung defconfig udpates for v4.1
Date: Mon, 6 Apr 2015 09:49:04 +0200
Message-ID: <CABxcv=njDwgF6CuEQLYg7V3cJT=UtkLgNKx-+T3pZRDg5T9e_w@mail.gmail.com>
References: <551C35F6.1090602@kernel.org>
	<CABxcv=kHPaJE4WGUHsgBPnFpT4aYqiodHVnTn+AccUhu3Te-Jw@mail.gmail.com>
	<023d01d07035$c499b650$4dcd22f0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:35999 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbbDFHtF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 03:49:05 -0400
Received: by wgra20 with SMTP id a20so20699199wgr.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Apr 2015 00:49:04 -0700 (PDT)
In-Reply-To: <023d01d07035$c499b650$4dcd22f0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello Kukjin,

On Mon, Apr 6, 2015 at 8:49 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Javier Martinez Canillas wrote:
>>
>> Hello Kukjin,
>>
> Hi,
>
>> On Wed, Apr 1, 2015 at 8:16 PM, Kukjin Kim <kgene@kernel.org> wrote:
>> > The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
>> >
>> >   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
>> >
>> > are available in the git repository at:
>> >
>> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> > tags/samsung-defconfig
>> >
>> > for you to fetch changes up to bb84296ae52da844c9cab81e0197152a69f2f841:
>> >
>> >   ARM: exynos_defconfig: Enable HDMI support (2015-03-27 02:00:09 +0900)
>> >
>> > ----------------------------------------------------------------
>> > Samsung defconfig updates for v4.1
>> >
>> > - update exynos-defconfig
>> >   : enable HDMI, CPUidle, ChromeOS EC chardev driver
>> >     and thermal emulation, Marvell WiFi-Ex, CPUfreq,
>> >     and support for NFS rootfs
>> >   : remove EXYNOS_THERMAL_CORE define
>> >     and disable IOMMU support until support it
>> >
>> > ----------------------------------------------------------------
>> > Javier Martinez Canillas (5):
>> >       ARM: exynos_defconfig: Disable IOMMU support
>>
>> As I mentioned before, this also is needed for 4.0-rc to have display
>> working on at least Exynos5420 Peach Pit and Exynos5800 Peach Pi
>> Chromebooks but I saw that it is not included in your "Samsung 2nd
>> fixes for v4.0" git pull [0].
>>
> Yeah, you're right. The 'disabling IOMMU' should be queued for 4.0-rc but I've
> missed. Sorry about that. As you know, the branch has been queued for 4.1
> already so if we send it even the one patch for 4.0-rc, it will cause conflict.
>
> So I think would be better if we could send it to stable after 4.1-rc1? If you
> agree, I'll.
>

Agreed.

>> Maybe it can be sent directly to arm@kernel.org?
>>
> I don't think so because of above reason...
>

Got it,  thanks for the explanation.

> - Kukjin
>

Best regards,
Javier
