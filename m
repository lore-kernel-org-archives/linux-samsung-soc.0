From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Wed, 17 Apr 2019 09:56:27 +0530
Message-ID: <CANAwSgR7a_gNGUSCkp1MH=t+V0iUfBEByn0UpO7=5xJXDHv7FA@mail.gmail.com>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
 <CANAwSgSX6q4M2EcWvEA3B6zQuY0DBrh-0_r3v__R--p7dzjs7w@mail.gmail.com> <CAJKOXPeUYw2DNEzRfKGzTmNAtg5mHJObVFHygKJ2eUdDpAFmOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeUYw2DNEzRfKGzTmNAtg5mHJObVFHygKJ2eUdDpAFmOQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Willy Wolff <willy.mh.wolff.ml@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Tue, 16 Apr 2019 at 15:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, 15 Apr 2019 at 14:24, Anand Moon <linux.amoon@gmail.com> wrote:
> > Cache Coherent Interface (CCI) among Cortex-A15 and Cortex-A7, G2D, G3D and SSS
> >
> > Level 0 > CPU blocks such as Cortex-A15 (CA15), Cortex-A7 (CA7) are
> > joined as the member of Level 0 CCI bus
> >
> > Level 1 > Display engine block (DISP) and 2D graphic engines (G2D) are
> > directly connected to Level 1.
> >   DISP, MDMA, SSS.
> >
> > Level 2 > While all the other IP is connected to Level 1 bus via Level 2 bus
> >    G3D, MSCL, MFC, ISP, JPEG/Rotator/DMA/PERI, NAND/SD/EMMC.
> >
> > So my question is the mapped with the cci ip block correct.
> > Level 0 (cci_control0)
> > Level 1 (cci_control1)
> > Level 2 (cci_control1)
>
> Hi Anand,
>
> I do not understand the question - what is mapped with correctly or not?
>
> Best regards,
> Krzysztof

Following the https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cci.txt
CCI node linked to CPU and DMA nodes for example.

On this line below diagram from Exynos 5422 UM show various IP block
linked to CCI level.
Below image just elaborate overall architecture of Exynos 5422 CCI.

[0] https://imgur.com/gallery/0xJSwGQ

So we should map the various IP block to corresponding CCI level.

Best Regards
-Anand
