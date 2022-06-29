Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA311C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 09:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiF2Jrf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbiF2JrR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 05:47:17 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B13C3DA60
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 02:47:13 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220629094711epoutp03257077443ee51994d3f6828d6128ec66~9Dl1M-HcI2558125581epoutp03Q
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 09:47:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220629094711epoutp03257077443ee51994d3f6828d6128ec66~9Dl1M-HcI2558125581epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656496031;
        bh=iqF2apEkCvZdAPYu4EcErqLDGzRBguavBQSGJXfAqQ4=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=KWS9zucVoVlicr6i1IxKt2DLwn39zJr3TfCR+OFLb3XnDWI85HVm2+bm/CpyOJj+L
         +g8sLHnZaN4V696gJ0tcKHn91WrbiMfi2P7GznYCf3sBliXVBlOSIw3F6al4RbY+Lg
         mQYvkG25bwbZ8lIud1h7MkljGN5ppSdAcBRUBoGo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220629094710epcas2p2e28379ee46c79a1221395566f1f46619~9Dlz75XYc0427704277epcas2p2q;
        Wed, 29 Jun 2022 09:47:10 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LXxSs6PCjz4x9Q9; Wed, 29 Jun
        2022 09:47:09 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        66.1F.09650.D9F1CB26; Wed, 29 Jun 2022 18:47:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220629094709epcas2p34992641ea8cb55a8fff679471b9869aa~9Dly10Wcf0170901709epcas2p3H;
        Wed, 29 Jun 2022 09:47:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220629094709epsmtrp27277ed7790302eb6412a8caa49d00c56~9Dly0es3f1409214092epsmtrp2j;
        Wed, 29 Jun 2022 09:47:09 +0000 (GMT)
X-AuditID: b6c32a46-0a3ff700000025b2-d6-62bc1f9d0645
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D3.54.08905.D9F1CB26; Wed, 29 Jun 2022 18:47:09 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220629094709epsmtip28d8e3b665565c8f4573ea25f9ee99a6b~9DlynwsV02096820968epsmtip2A;
        Wed, 29 Jun 2022 09:47:09 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        "'Jaewon Kim'" <jaewon02.kim@samsung.com>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <acf6fb6d-46da-48f6-f064-1a08d323b0f1@linaro.org>
Subject: RE: [PATCH 2/3] arm64: dts: exynosautov9: add exynosautov9-usi.dtsi
Date:   Wed, 29 Jun 2022 18:47:09 +0900
Message-ID: <025601d88b9d$332049b0$9960dd10$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQEp4vOGDSKs9voJE7nXsru3sJlKUQHq1LSjAWulMQACV0OHza6WBHZA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmqe5c+T1JBo3njS0ezNvGZjH/yDlW
        ix0NR1gt+l48ZLbY+3oru8Wmx9dYLWac38dk0br3CLvF8759TA6cHptWdbJ53Lm2h81j85J6
        j74tqxg9Pm+SC2CNyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
        8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
        WmJlaGBgZApUmJCd0XBgOlvBBo2KRXtXsTQw9ip0MXJySAiYSBz4+Im5i5GLQ0hgB6PE4+Zu
        FgjnE6NE75ODUJlvjBJLZ6xhhmlZtnc7E0RiL6NEY/caNgjnBaPExFffWUGq2AT0JV52bGMF
        SYgILGaU6Lv8EayKWeAno8SJ1sdgszgF7CRerfjPAmILC/hILNsPEWcRUJU4130CKM7BwStg
        KfFpgQhImFdAUOLkzCdg5cwC2hLLFr6GOklB4ufTZawQcRGJ2Z1tzCCtIgJuErcfSoKslRBY
        yiFxbPVxRoh6F4llr96zQNjCEq+Ob2GHsKUkPr/bywZhF0ssnfWJCaK5gVHi8rZfUAljiVnP
        2hlBFjALaEqs36UPYkoIKEscuQV1Gp9Ex+G/7BBhXomONiGIRnWJA9unQ22Vleie85l1AqPS
        LCSPzULy2Cwkz8xC2LWAkWUVo1hqQXFuemqxUYERPLaT83M3MYLTqpbbDsYpbz/oHWJk4mA8
        xCjBwawkwrvwzM4kId6UxMqq1KL8+KLSnNTiQ4ymwJCeyCwlmpwPTOx5JfGGJpYGJmZmhuZG
        pgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6mDg4pRqYNIrP7n6wkL3qp/2CQ8Gz2j2cd+cVHXp0
        JohL/IzGD8ETtrvOJC8KbCmqzLnFLanyuUr8f/DOwqzLrxdUzLwkX10ZV3X4fPXE109m3jQw
        V78Z8Wn6O8df3ZuPb+cWWzP3+LZL6RqVt34tntkgXtxv7LBd2qZ14UFxy1n792gwa6+cJGen
        2tMXaM++dKbKGuey85cndeaGe+/4Gfn0muQ9zd9LzuipPOI/4HykIKuU2VFlm7Nv/qzUjjmH
        y6MUbHPyY1Xcy9e+XrR0qewDli1ap/n8NzxcMy1D7P7ls1zZPFvC7hz5XHXR5CJLqWd4R8bK
        Jr35Te+2R/ccSPKf/WKzQrvCyud/b1ZI71Or6jBUUWIpzkg01GIuKk4EAH6WRtE0BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJXneu/J4kg5+zuSwezNvGZjH/yDlW
        ix0NR1gt+l48ZLbY+3oru8Wmx9dYLWac38dk0br3CLvF8759TA6cHptWdbJ53Lm2h81j85J6
        j74tqxg9Pm+SC2CN4rJJSc3JLEst0rdL4MqYefYSe8EJ9Yq2pidMDYxz5bsYOTkkBEwklu3d
        zgRiCwnsZpTo/xcBEZeVePZuBzuELSxxv+UIaxcjF1DNM0aJk6v+MoIk2AT0JV52bANLiAgs
        ZpQ4uH0eE4jDLPCXUeLBnzY2iLHfGSXuLwkCsTkF7CRerfjPAmILC/hILNv/mBnEZhFQlTjX
        fQIozsHBK2Ap8WmBCEiYV0BQ4uTMJ2DlzALaEk9vPoWzly18zQxxnYLEz6fLWCHiIhKzO9uY
        QcaICLhJ3H4oOYFReBaSSbOQTJqFZNIsJN0LGFlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXr
        JefnbmIEx5eW5g7G7as+6B1iZOJgPMQowcGsJMK78MzOJCHelMTKqtSi/Pii0pzU4kOM0hws
        SuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYpLLtWW4dWVWu9oF9VuwV+5fdFx0ZY/MkZv1d
        dOLi3Bs3r76053hcWfCgUq3zxyZ1owkuHnvXpHy9Ks+on/VoZ0BYCecBSVk5X97n/Spc21x1
        bZXdG1s40y+IOc/tniv8QOnKu0PqLznO2cb8rX6m5X14hdoujlnbzs9oPbtl3imDd8b7v8Qs
        W2mV1mvm2WC9WkzTZLPZBE9Tt1qjC98+dL7YbONqvsvZ6kfHfnfts/9Sq1L0Di7+J91hZSoY
        s3QXj/19vkme+1Z6pj83TLzOuPHiyYak/UGnHmf+U+vezCfjrn9zxhpvWabmpy6RJWlTN2/Y
        O+2InK9mu/eaiZv9Pf+s+mwuuCc+ull5ssNvJZbijERDLeai4kQAsuEHbx4DAAA=
X-CMS-MailID: 20220629094709epcas2p34992641ea8cb55a8fff679471b9869aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0
References: <20220629015650.138527-1-chanho61.park@samsung.com>
        <CGME20220629015913epcas2p1dcfcc81c026aa524a1f35c8e393be4f0@epcas2p1.samsung.com>
        <20220629015650.138527-3-chanho61.park@samsung.com>
        <acf6fb6d-46da-48f6-f064-1a08d323b0f1@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> On 29/06/2022 03:56, Chanho Park wrote:
> > Universal Serial Interface (USI) supports three types of serial
> > interface such as Universal Asynchronous Receiver and Transmitter
> > (UART), Serial Peripheral Interface (SPI), and Inter-Integrated Circuit
> (I2C).
> > Each protocols can be working independently and configured as one of
> > those using external configuration inputs.
> > Exynos Auto v9 SoC support 12 USIs. When a USI uses two pins such as
> > i2c and 3 wire uarts(RX/TX only), we can use remain two pins as i2c mod=
e.
> > So, we can define one USI node that includes serial/spi and hsi2c.
> > usi_i2c nodes can be used only for i2c mode.
> >
> > We can have below combinations for one USI.
> > 1) The usi node is used either 4 pin uart or 4 pin spi  -> No usi_i2c
> > can be used
> > 2) The usi node is used 2 pin uart(RX/TX) and i2c(SDA/SCL)  -> usi_i2c
> > should be enabled to use the latter i2c
> > 3) The usi node is used i2c(SDA/SCL) and i2c(SDA/SCL)  -> usi_i2c
> > should be enabled to use the latter i2c
> >
> > By default, all USIs are initially set to uart mode by below setting.
> > samsung,mode =3D <USI_V2_UART>;
> > You can change it either USI_V2_SPI or USI_V2_I2C.
> >
> > Signed-off-by: Chanho Park <chanho61.park=40samsung.com>
> > ---
> >  .../boot/dts/exynos/exynosautov9-usi.dtsi     =7C 1127 +++++++++++++++=
++
> >  1 file changed, 1127 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
>=20
> Put all this directly in exynosautov9.dtsi, because this is not a re-
> usable piece among different DTSI.

Okay. I'll move them in the exynosautov9.dtsi. I thought they're too long t=
o put in the exynosautov9.dtsi and I also found a similar case such as exyn=
os5433-bus.dtsi and exynos5433-tmu.dtsi.

>=20
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
> > new file mode 100644
> > index 000000000000..0e4c6332770b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9-usi.dtsi
> > =40=40 -0,0 +1,1127 =40=40
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Samsung's ExynosAutov9 SoC USI device tree source
> > + *
> > + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> > + *
> > + * Samsung's ExynosAutov9 SoC USI(Universal Serial Interface,
> > +uart/spi/i2c)
> > + * are listed as device tree nodes in this file.
> > + */
> > +
> > +/* PERIC0 USIs */
> > +&soc =7B
> > +	syscon_peric0: syscon=4010220000 =7B
> > +		compatible =3D =22samsung,exynosautov9-sysreg=22, =22syscon=22;
> > +		reg =3D <0x10220000 0x2000>;
> > +	=7D;
> > +
> > +	usi_0: usi=40103000c0 =7B
> > +		compatible =3D =22samsung,exynos850-usi=22;
>=20
> We should start adding dedicated compatible, so:
> =22samsung,exynosautov9-usi=22, =22samsung,exynos850-usi=22

So, I need to add the compatible to the Documentation/devicetree/bindings/s=
oc/samsung/exynos-usi.yaml, right?

- samsung,exynos850-usi   =23 for USIv2 (Exynos850, ExynosAutoV9)

To be>
- samsung,exynos850-usi
- samsung,exynosautov9-usi

>=20
> > +		reg =3D <0x103000c0 0x20>;
> > +		samsung,sysreg =3D <&syscon_peric0 0x1000>;
> > +		samsung,mode =3D <USI_V2_UART>;
> > +		=23address-cells =3D <1>;
> > +		=23size-cells =3D <1>;
> > +		ranges;
> > +		clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> > +			 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
> > +		clock-names =3D =22pclk=22, =22ipclk=22;
> > +		status =3D =22disabled=22;
> > +
> > +		/* USI: UART */
>=20
> Skip the comments, they are obvious from device node name. Long time ago =
I
> was not advocating this, but I see it's benefits - much easier to
> introduce changes to DTS or binding in case of some differences.

I'll drop them.

>=20
> > +		serial_0: serial=4010300000 =7B
> > +			compatible =3D =22samsung,exynos850-uart=22;
>=20
> Here as well.

I'll add =22samsung,exynosautov9-uart=22 to the yaml file.

>=20
> > +			reg =3D <0x10300000 0xc0>;
> > +			interrupts =3D <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D =22default=22;
> > +			pinctrl-0 =3D <&uart0_bus>;
> > +			clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>,
> > +				 <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>;
> > +			clock-names =3D =22uart=22, =22clk_uart_baud0=22;
> > +			samsung,uart-fifosize =3D <256>;
> > +			status =3D =22disabled=22;
> > +		=7D;
> > +
> > +		/* USI: SPI */
> > +		spi_0: spi=4010300000 =7B
> > +			compatible =3D =22samsung,exynosautov9-spi=22;
> > +			reg =3D <0x10300000 0x30>;
> > +			interrupts =3D <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D =22default=22;
> > +			pinctrl-0 =3D <&spi0_bus &spi0_cs_func>;
> > +			clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_IPCLK_0>,
> > +				 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>,
> > +				 <&cmu_peric0 CLK_GOUT_PERIC0_PCLK_0>;
> > +			clock-names =3D =22spi=22, =22spi_busclk0=22, =22spi_ioclk=22;
> > +			samsung,spi-src-clk =3D <0>;
> > +			dmas =3D <&pdma0 1 &pdma0 0>;
>=20
> These are two separate phandles <>, not one.

I'll separate it.

Best Regards,
Chanho Park

