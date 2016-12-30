From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos5433: Add bus dt node using
 VDD_INT for Exynos5433
Date: Sat, 31 Dec 2016 00:08:43 +0900
Message-ID: <CAGTfZH0Q4UmbVH3SnuvGJ5-wSSPvgn7PANtAQuA5Lnz5qOL1fw@mail.gmail.com>
References: <1481173091-9728-1-git-send-email-cw00.choi@samsung.com>
 <1481173091-9728-5-git-send-email-cw00.choi@samsung.com> <CGME20161208175257epcas2p333f794a00f433dd8312a5faa088a5f34@epcas2p3.samsung.com>
 <20161208175243.GA9451@kozik-lap> <5865B165.3010203@samsung.com> <20161230145155.ecobfvtspviehlos@kozik-lap>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33318 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754194AbcL3PJF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Dec 2016 10:09:05 -0500
In-Reply-To: <20161230145155.ecobfvtspviehlos@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>

2016-12-30 23:51 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
> On Fri, Dec 30, 2016 at 09:59:17AM +0900, Chanwoo Choi wrote:
>> Hi Krzysztof,
>>
>> On 2016=EB=85=84 12=EC=9B=94 09=EC=9D=BC 02:52, Krzysztof Kozlowski wrot=
e:
>> > On Thu, Dec 08, 2016 at 01:58:10PM +0900, Chanwoo Choi wrote:
>> >> This patch adds the bus nodes using VDD_INT for Exynos5433 SoC.
>> >> Exynos5433 has the following AMBA AXI buses to translate data
>> >> between DRAM and sub-blocks.
>> >>
>> >> Following list specify the detailed correlation between sub-block and=
 clock:
>> >> - CLK_ACLK_G2D_{400|266}  : Bus clock for G2D (2D graphic engine)
>> >> - CLK_ACLK_MSCL_400       : Bus clock for MSCL (Memory to memory Scal=
er)
>> >> - CLK_ACLK_GSCL_333       : Bus clock for GSCL (General Scaler)
>> >> - CLK_SCLK_JPEG_MSCL      : Bus clock for JPEG
>> >> - CLK_ACLK_MFC_400        : Bus clock for MFC (Multi Format Codec)
>> >> - CLK_ACLK_HEVC_400       : Bus clock for HEVC (High Efficient Video =
Codec)
>> >> - CLK_ACLK_BUS0_400       : NoC(Network On Chip)'s bus clock for PERI=
C/PERIS/FSYS/MSCL
>> >> - CLK_ACLK_BUS1_400       : NoC's bus clock for MFC/HEVC/G3D
>> >> - CLK_ACLK_BUS2_400       : NoC's bus clock for GSCL/DISP/G2D/CAM0/CA=
M1/ISP
>> >>
>> >> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> >> ---
>> >>  arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi | 197 +++++++++++++++=
++++++++++
>> >>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     |   1 +
>> >>  2 files changed, 198 insertions(+)
>> >>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
>> >
>> > For the reference:
>> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> >
>> > I'll queue it for v4.11, after this merge window.
>>
>> Could you please pick this patch3/4/5?
>> These patches were already reviewed by you.
>
> Not yet. I wanted to apply them few days ago but arm64 build is broken
> in 4.10-rc1 so I cannot auto-build them in my system. The arm64 is fixed
> already so I will apply them on top of 4.10-rc2 (when released).

OK. Thanks for reply.

--=20
Best Regards,
Chanwoo Choi
