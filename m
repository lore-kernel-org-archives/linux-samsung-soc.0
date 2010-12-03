From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
Date: Fri, 3 Dec 2010 14:52:23 +0900
Message-ID: <AANLkTikjXjS3AwuaYdRSr7Gs7jR3Yg8_vK4vrS62syDT@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
	<012401cb92a3$a46443b0$ed2ccb10$%kim@samsung.com>
	<AANLkTimEEf5eD+q-qx7gw21ryFp1bbQ084Lo=eX+Bqjz@mail.gmail.com>
	<AANLkTiksQM8V9QeF+P2qvCQ1uOgcq-yzKp-kgnPVmMsJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:39416 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751692Ab0LCFwY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 00:52:24 -0500
Received: by bwz15 with SMTP id 15so8007017bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 21:52:23 -0800 (PST)
In-Reply-To: <AANLkTiksQM8V9QeF+P2qvCQ1uOgcq-yzKp-kgnPVmMsJ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 2:34 PM, Kyungmin Park <kyungmin.park@samsung.co=
m> wrote:
> On Fri, Dec 3, 2010 at 1:59 PM, Jassi Brar <jassisinghbrar@gmail.com>=
 wrote:
>>> Sylwester Nawrocki wrote:

>>> +#define S5PV310_PA_CSIS0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (0x11880000)
>>> +#define S5PV310_PA_CSIS1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (0x11890000)
>>
>> Let us please not contain constants in brackets.
>
> I think consistency is more higher than your comment normally.
>
> if you think these, then make a cleanup first.

Bad logic. One shouldn't hold good practice at ransom because of
the past bad ones.
