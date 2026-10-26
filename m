Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022723;
	b=4HJr09N9uXCRLOdydFROtec1VcM8hLccpq1kGJ1qC2zsOPb9LhImbf497dg6atzOAH2A
	 xjFUqPP4WaIZEIPkgT8zWBVOhJiklkHUZGRTkGNnjyScaLJ26C2k0as+me28QiM4tPgNc
	 sLQQEN96Aatvm70Pd/ZVNFYhjbWq8so9NU+Ywsm3+6tyc708yYvNvjIJ40LeE1Z51RzE0
	 SHrzPlTEykvbtnlLlDZfqZdHjL5skh+NXsYi7y5JzFgeMWOnzwMh6fofxow7gkt9lSzXw
	 kwgpEqNmTajnwC4UNjsxJgZ93GjNTnmFzQHPnYCbu8mML2g0NQvRGU20q15dtGC3dQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022723;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=;
	b=W74+ocdwYbhgsqZDYBMcZ4cqI4WSbfF2NNzoTExm/qbL9kgIcFw10lGAuhw6QBB1lMma
	 JGiwiEa7U26Mui0uvN70lEzlqRcGnRGNTnSmIUTxKSWeh6hVMwJ8z6TIR3R0EuWNc3wzp
	 224uYmJ3PASYZeJFSuroo4w9HKG0NmW7wGaSzWlkMCKyZCIPr2RWntp9btgwow/ganJbB
	 K85bhTRfqHCffj38oDH+iTMRzg6P9EQ2N2uz5Azp9npuijGfKRt3THvgpFLH8dadATxZk
	 w/+9qoTNp9Y0PccLbhqNWDhNz0vd6yN5sLGD+bCPxCwtBKCT9+mtGucr9ndtH7KKqiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="hxEh/ZsV";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="t/Npa1R0";
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D596606A322
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D596606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hxEh/ZsV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t/Npa1R0
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id CBC5BEC016E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:52:01 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 26 Oct 2026 09:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793022713;
	 x=1793109113; bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=; b=
	hxEh/ZsVMXx0VaMd/+M8Z96je/vs1Zp8GiGfwLUU3sMVKxrSEqFM1LWqRrwVWgxD
	ic0sjz+MicnBUw5CZJPlx0Im3sJpaRjNc/HJGDjCajNWx4gGJdpwfkIQYj6wNBgt
	e+eBnu22SH8Y13GRb32d0cm7GJHJYhAaN3NtprW97s/y44jdKzmoaT39V/9RtiVL
	lgSBIebc6e8J0HOOX/kHDyFaCPKp11iqSuPK/+z/Z1sc7CsYx0MNLVw0B5TzOJEa
	gkEOLtE9ere9nNr543UjbRUwyLo/hIH2Tb02YqGaI11nMi6nMznFeQ5tAhWomJwg
	xhQZsW0krpAfTW46v/PmQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793022713; x=
	1793109113; bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=; b=t
	/Npa1R0HkfQ14yvATXInKphJDtSyIRV5l1q/k/issD2KJKlkaDH69zU27cQn31VR
	H/FdlWiJIZjeUOxC5j4CEIeFRIQx04x8vxSKD+BnbxlKq/MnpFi+LAh8jRGMfd4p
	fkywLOY6ZkHPeBjcsrMyhy05dVvMtGODDM3QTKzc2OkJ5z1p5YAZkqxjhpFWlmde
	zRW7wyDzFw7qtTunUW4h7T3yrEQLuu+UMsWuWq5cIrRgH4qglLFfojmgY0XeKJTr
	CyW8svbnP5DaX2g7vzUefeiuA2V3xw/alfRwqv/kCN7yCXqTd+3u9gLDb589PkGD
	zGpTnWmH5v+LDlhzK7Cbg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793022713; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:lRij0Hs87PQMJLCi2xjbOOiAjnUVwp+vRg+ViNs69cEoX+n
	g62uhEI8oVlWL/Ey6crRQpE7jmcVYzzZE/cTOAyV7fog7+1ods1q6FofNPPLl0Lv
	xGY6GXJVMRgg6vu9y7IUswIevPVGhJH93kU1L1zhV1LXarpkeUT1kLmnYVLrW4+p
	5ajFwF/j9G7Z2P1/k25SE8nl1+TRpKlYRFVcbQPDOPNi1F+ukgWac7iWqZ5TlYjc
	Ud4c0XmfOoM0XM7201j+LiiWdRYUZTtg4T8dSV0eUcyzPaHB6oADvNo32iEbfsUy
	SreqTU8cXzI3NnOBaRwDwSG1bMg8CqzBZNuOEmQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Oy/howkruMFXJD3laxRsMr4nOnclTbF4SNSQ6L93fKU=:KtX4k3ya7RcU8NJ3EsCTbOk4F9OmT8AIpqn6aAliyFk=;
X-ME-Sender: <xms:81rfaljJJ3gxVsOVJ5b0Iz5j0m47vRpWtVSiAphiT1Etk6luBcYQMQ>
    <xme:81rfak2ehLAhgKTK5zig3tDAtZ1co2alavnEDhfKb4XkER8uQ8U6KVrtGuTxQzR66
    J2dmDyQE6m0GIlPem8cM79NX1Z3JbFKQBEd1U0fZ9uKzquF7OrXOJKz_g>
X-ME-Proxy-Cause: dmFkZTE10nT9aBR7VZGvooOUSEy9GXDTiA4fuLwAGQk8gcKjnfNQfW7SSsRSjF46yJnilC
    ug+nAoOlsm9ni3ebzgzSGJQTNboxVBBt0rTBObzgYi41jG1ILiJdkgROT/uof9eFptJse5
    A/btnyQRsPuQSDLUJUyv+dDyIWiP2iy5NVIt+T7Uh/uddWL3I90XhDupPX5M2vCqxcXQSq
    DwEcdDZqwm/UTSkgzVRlQ3pVQizQ7FMRRau9ixulXaj32FeKpkicStKj4YiY4HslYkiAaw
    goJG1x5bgtcelQrzM8UffY+pZItrjSQfzVqS/KifCHl8bsUOm3U37cipWrWqSXt4182EWf
    Eik/LS5y0fz+oAnEp9bUrQWhuYEjFQKeLzSREa89M4D8HV6rRTfQ0mqBsM9qcJUgYPmxMe
    sEyVhxNgO6AxEuWlZeLmqotx/P8Bhcb6RxrvkNzQVnmEUzebcZEplqJxS+KuEYomjiS2GY
    cN72nYbIOtIGEIRDJ9etf0A2gGSlwKw6m3Rgk2Dkc5/Cb/yZchesW11dNuIuPxudNvPKED
    dKhQaWo3Js5LXQqwCzEdIu0bDGLWP4TSJCa+ZPEA6SwlcCTEZwrwzLY57F0AUf655SM5SG
    S5NeYVsEIA3aUIzcD4sCrp4UTGkR0cY0NljKqhKlc/BzwBjgvzdO2/ArwPzQ
X-ME-Proxy: <xmx:9lrfai7MMHWvIpkcN7Ex5paFsEknNsUPslrfZRwafLq-NQEsd0Rnpw>
    <xmx:9lrfamkcRv4lrYDS2g6ntYkeiTSDdVz0R2bpb4U2gCkPS39zq66rZw>
    <xmx:9lrfaoEh7Ix8f1v3crW6hERWF3Um-x7HKNkbpV6FpuGkSX8Bd8LnIg>
    <xmx:9lrfaqHFuIS2W1vz-hDVLSax1chdktmSPzQjFRWyAEF-LETbuYAkYg>
    <xmx:-VrfagmAfe00RPWSkxcZJ3xx5c7E_MlNrP2HqaJaTR3cSUgzjJdapRYy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3F1D932A0093; Mon, 26 Oct 2026 09:51:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AIMzr2H-57Yw
Date: Mon, 26 Oct 2026 14:51:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Russell King" <linux@armlinux.org.uk>, "Mark Brown" <broonie@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Message-Id: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> Hi,
>
> This series converts the Cragganmore 6410 board to generic software nodes
> and device properties, allowing the removal of legacy GPIO lookup tables.
>
> We add software node propagation support to the wm831x MFD core to route
> DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> from legacy GPIO lookup tables to software nodes and properties. This
> eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> GPIO chip names from previous conversions.
>
> Hopefully Krzysztof can finish merging the series through the soc tree
> once Lee acks the MFD part.

Hi Dmitry,

This all looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

I'm a bit unsure about how this fits into your wider plan, i.e. why it
is helpful to replace the lookup tables with device properties in
this file:
Are you working towards eliminating all gpio lookup tables from
the ~50 files currently defining them, or is there an immediate
benefit to doing this one in particular even without the others?

Do you plan to also eliminate the uses of the legacy gpio
interfaces in mach-s3c, e.g. the hardcoded numbers
in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
crag6410_machine_init(), or the pin config in
s3c64xx_i2s_cfg_gpio()?

     Arnd
