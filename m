From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Tue, 16 Apr 2019 12:19:15 +0200
Message-ID: <CAJKOXPeUYw2DNEzRfKGzTmNAtg5mHJObVFHygKJ2eUdDpAFmOQ@mail.gmail.com>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk> <CANAwSgSX6q4M2EcWvEA3B6zQuY0DBrh-0_r3v__R--p7dzjs7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgSX6q4M2EcWvEA3B6zQuY0DBrh-0_r3v__R--p7dzjs7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Willy Wolff <willy.mh.wolff.ml@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Apr 2019 at 14:24, Anand Moon <linux.amoon@gmail.com> wrote:
> Cache Coherent Interface (CCI) among Cortex-A15 and Cortex-A7, G2D, G3D and SSS
>
> Level 0 > CPU blocks such as Cortex-A15 (CA15), Cortex-A7 (CA7) are
> joined as the member of Level 0 CCI bus
>
> Level 1 > Display engine block (DISP) and 2D graphic engines (G2D) are
> directly connected to Level 1.
>   DISP, MDMA, SSS.
>
> Level 2 > While all the other IP is connected to Level 1 bus via Level 2 bus
>    G3D, MSCL, MFC, ISP, JPEG/Rotator/DMA/PERI, NAND/SD/EMMC.
>
> So my question is the mapped with the cci ip block correct.
> Level 0 (cci_control0)
> Level 1 (cci_control1)
> Level 2 (cci_control1)

Hi Anand,

I do not understand the question - what is mapped with correctly or not?

Best regards,
Krzysztof
