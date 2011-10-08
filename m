From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH v3 RE-SEND 2/2] iommu/exynos: Add iommu driver for Exynos Platforms
Date: Sat, 8 Oct 2011 22:25:45 +0900
Message-ID: <CAHQjnOPRvjD1X-T3w1yDKhf5QLq9rz9Vc2vs2yzU1xynFx-Wow@mail.gmail.com>
References: <01e601cc84d9$4530d6a0$cf9283e0$%kim@samsung.com>
	<4E8F6532.9060609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52448 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752443Ab1JHNZr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Oct 2011 09:25:47 -0400
In-Reply-To: <4E8F6532.9060609@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, joerg.roedel@amd.com, Ohad Ben-Cohen <ohad@wizery.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, younglak1004.kim@samsung.com

On Sat, Oct 8, 2011 at 5:46 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
>> -
>> -config S5P_SLEEP
>> - =A0 =A0 bool
>> - =A0 =A0 help
>> - =A0 =A0 =A0 Internal config node to apply common S5P sleep managem=
ent code.
>> - =A0 =A0 =A0 Can be selected by S5P and newer SoCs with similar sle=
ep procedure.
>> -
>
> Is S5P_SLEEP being removed intentionally ? It doesn't seem to belong =
here.

No, it is a mistake while rebasing the patches.

Thank you for pointing that.
