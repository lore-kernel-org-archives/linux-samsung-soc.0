Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345321;
	b=1mRB070VJ85gIdCdhZlYBHetdJEzD7BE5LggEtlp/b/p1IAMFSLTpIyjoJr8q8hT+MGl
	 xKK+Nm5APpMD2on1HkkyVFos6d3+o4VhAoXe83OP/c5xl4+jvlAcXqlB88duFmR0DLCVY
	 2AoDZ0YZta72Va3SA8e9/iQxyTT4wlgp0yHvS/5AMNgmygOztaZb5m1aNNZpAFKCE5fEs
	 25kuBmSNySxzMKYp5t6dLFy6MRL/00ovlRihUMRuALlLNihgvriP18FI2Ci1Jb2traVLk
	 kqdGVmY+nkWBvMXaOB+fH+p0m1rEnhd9WGKrPCK5je8d2YUHkM4BLpAuPyikwEGj7Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=1vCqPvYiCFH8BoJ9H4Qyr2I5oc6v9hkMLiwl6wYPqAXDNuHpnIVpEmAhCfB/J1H1j9DD
	 pah9Cg7zLJG1s0Zpe4TTuebHCCAy2l/tPJU/I8UL24dgG8EGyr6fRBBkO9Vxyu9AfHd9j
	 Lv9LdKbPuxzuyEWwz40FCbnw52tJ2g/HaLlJozPIBmJLwscROyvRptjfn0GAz8Nc+it0s
	 4cXNYJpn6qBNA/NrX4GNX/IFSCxMgBi9ndVCiGJMQ6qhis7A0+uRyY8H8ajyhsA6P+4K0
	 idkffLQW3MWfQxVoV1Gse+IlKAoQArSM2Mb6QthSKQ1u4o7kOt6N/xSd9kgZsnUEObg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IKy+T/qh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30034606A31E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30034606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKy+T/qh
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798c43a3d6so258937d50.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=VR0qRfcXc6QFkcEqWSIH+XSSYyGuqUEPR1Nmk918xWWdNSVviCVM78AOXOeJhfD9Q9
         Ai8KvV2pr7xhgLea1obbFb3WZtlrnxqbHfaiZgIIhmHBvYIZVj4a6xWg/HDBcf6gZvoh
         pRwqGgJIlnhV9ldP1oI9peiFqh0LGa6JyW3gfFDtvZQGfPq1UyunNLBJa4d0hbTFwSlC
         u9Sbn6FjRmu9iCPs4UXOnNu0kYnQlifdKIbs3RBoy0NipBIiq1OpC7KP26fWY9Qagkma
         mK1XFob8xS/3cDTF0P1gxwJg2mACbgd/9aBRDYXvMOBiTIR6ChwnQf2I4ZDdzfB23lNl
         9l1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=Qjp9Wj1J34jR8Mu7mlur4mMTeL2Tis+NT9Yjy6Z1YTg=;
        b=lgShWX4VgEMmJH9pb9yXya2XHY84MXo/VbniApkZGhmAS25sV80PtGb1uZpDLJSR18
         dxJ+rDwdJECo602o3DSuXLM6bZgomCGBbvYrP3vSYgR9FCF6MDLIFSYPEpiIGoYuo8BU
         yFq10aX0Z/G1jp6CzAx6J+FzuGLHdP1ehXqnUnu4S1FjV6desPuPvTY5MBxldcIzyDxy
         801+Un8pSEhrYaHztZut/al6uRWmpsCdf7l/Q7KooJMa6KYDCM/rw2pF0HuAlXZhzGpA
         pIvEV0tHIAR6hvZWy8dFWig51TNdYz1ZpJg4Ux8roPNHWqsGGFy+tAWCo7KW4VdXWqYR
         qEQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IKy+T/qhhIrUOzchV2V4rsBprme/Hu+3Hl6zCa01nFTCsOY9pKmewlMrEn4BQLOwW9
         feJJmNQO23DQ3rGjEzuWcIeZR34xo5NfY4KNRYFVsQwIp9ColIO/GW+PGca/8KtFU+/f
         l1bdJasJc0Tz9mTRQCSooUk0FYHVl951kJDfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IAauxDOdr6XZNUvyAi1i39Hsx1CRdZ9o8minU8yGtIbhV4t5BTLaOZtk4Y3NADB6HS
         XUQ95IQHYhqO00ulEUEbjZ9RiAmZMVr5z3Sk5hv9HRk9VMwkeYkJWLlG345iR0s1zQrR
         aikbP369hHScitFLQ+THHuIsZAfVyNhnYzC6iF8UEGJQX4zFMsrkcEYexOq3rO5ogTxc
         qRxa/3/GRPxcW9CEkhMjxCCi2D5VxmnKnAJd7QQq9i4d0LP+iQjYKI29Tqh8BuqXoxAU
         tXo4WyzZzAuaLECPHHuH2tFEDthzprrPdZjPKXstFcmmMKnfioUFVm2Cu4huuHZIpDVn
         hStw==
X-Forwarded-Encrypted: i=1; AKwUvBx98quVKiwl9HDz0Tpy89TaAwUVO7oEJkGAaBuXo7R0NCmYB9DXbso3Cvqb3kdYUs+yJi8PNpdGyVQaKhYLID2fgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwjPrSKPWM7MNWGjDrCu6eVAcPDIAmKyuoWO5fhvSMJ8G4akzo
	/KTfxgCW9VfUy7k/Z1a/uUtECp8Y8bRG1y+wOqWqrv0TyzIWExfu9zaNHDt+ETw55AMYPGrAnUH
	U6fNp2xiNYqB5/LnmNsI2/neZM1h7F8zTOpdpRrND
X-Gm-Gg: AYBFou0wV3E5zmZafwiBIF6dpZyyryJSHdj3jskmH6D1LtuZLZBOBn583v8LjcnmRrP
	s10sSAkUI3pBgbSRigxKjQDawa2ZKbHrf9HrYrnQexirqFteC1wmOs4wK34n4dEX28oQwc378AT
	BggCnJmNNqs41bFixF/wlq0rqlsfhkLP+OFKrcG/1yPxEQnb3whRe/KU8QLGx5VAfglB0CcNVz+
	VxAu52/xHHU/uZt6/F4ISWOIvuUYQDWZ81u+KoR3YkbNvOz7sx9TdJZxAl18xJPkVMa2t3BgnD8
	5bCVFvkywem6b3+w0DcrYSmSzPs5Lg1Gcrl1KSWOXa1wG0nlFzqB4q+KaF1grmvj55039s1FzDV
	171H6ieD3u7rny11hJQ+efM7m8PpO7/MVEYWX7JEM3D8QykRe1iLqSIPSUAaKhqW5XTE=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
