Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697373;
	b=l6mhHMuhm6OBWvAKO49DSoICBVsnHxT3r7GGhT6czfM5hqy/y0KIqcWHoapPRdXFuUyq
	 ZKmnDeOsqXCEcSazoAekau5KQMxIQXaDt8u5eKdkKKOxN8sqjdo3G8FZ8KYXianiRK+It
	 2+CwGzABtQGiz66vAOyBZzWBpfoF8qa96UPHeJVSs6xYhQ2UT3k8vGLqL2M/18x9ZPjG7
	 iRYCa7WvBb0tNmp+SuHtXJOltfcR1alVLkwvlNDYSdCx83u4gAuW+zszr2CNhtljE79lI
	 SNCqIK6oGjkOh2PEFrJShlaZlhGSFWuEz+nEanBu31ykwS3L4BdsAnaGKHXwUQfZ2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
	b=tXDQZjzEfA4iVpDsjEn3ik49irwx0fNEbMoK7dtn0f6zEvtHs96zwLnnyogQGhYACIrw
	 geAPSzQTO6WhUArS6meaZTDU3MYmvMHWVWLp+qtMGQEDfVec2f9zG5Sq8ZgLU6vslMdCG
	 +lH2VUhdXvHmwHlV+1akAJgWPljUWLpYwo8O6t/3zqnOC9pbPqx9euslNG6rIfMrL3rvm
	 8z2Y61pOk3LVZceZ8dAyrzUXu1bhaKMEKrzH6UDhCdpE3bnwlVGuYBUmvSb40lBlTUfpk
	 2OtJOW+tXZ14YEnlwG7Sy6VOnqTff2OVFqFH8uL6pXAfxbY+pYCxMuTceTa5z56I4FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E81606A680
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E81606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bvyXLUsN
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4113597f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=bvyXLUsNIqR6c+7zaBgO00QS5lwpt1s8YI+73qDqEW6pwpGMj0ZCG4Ele7FK5wO/1F
         JdRPOi5I+Fe2iOvU9908OPnaOE4MvdcMKW0PujeyKAPTN0o2kyInJs3jSZ9Xic+BULOV
         bm6WMOIz40qlEG5XsT8W48Bvt+uKsoXlQ/ezrqjetJxoFvgtGTjfgOMA1xNc+Q3wIxfb
         ycf9DbfZQstSMiueaJkccFvkEyp147oqwStk13TtdwdKbGfpGc3TDViSipTZzXAVDI2f
         upaPR2+y15YGvAFLwww3+uQWuarmTPJMp9bZANDRMXwB6953BI0WpUmF7Oy966ac19uL
         m8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=0Gqr5VIlMPuqDuN5vtjoPiGuwkPAj7OMMXd2r4Af0SjBhsQTP+RMSYvL+yP7eopK8d
         dA+m+pGX0FTTR3JLm0TGlHO6pxqh1Dc6Gx3cKNsl0+8H8FELGJUnXPPDiitIk4qycgD3
         qW1Q1hiAIlpgyT8WETv0Rv6PeenNVIa0A0R53KKXr62ZJ43ExeQ9twTTWhpUeDlubJCL
         5dH+aGWKIiGGsOoMXOKY0b5cMGMvYsuIYaFnwFmPKxaWF0oJzAuRwT9u+l1GxghE09J7
         9KfOLytXc9Je8+nLY1z8dgIivkurzQu7qNK8WB2Qh94DC6WtProGvovKnPPClKFvsriS
         Hr/Q==
X-Forwarded-Encrypted: i=1; AL+hErHkjIasvMaqg+HOMr1NKPuW89KaIY6tIOOfvjff5cn3EUn0YXUsxVqYC9w6u/SEZmG3+oS1KBibf+a//i6mjqN/ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HwIcplXzUrlwQmWdlhuJiS88AK6Y/RoOpwexYRCVZoPhHR5Z2
	BUmlhBG6lxkQxaO8eKspMtTu9PdzlAq4ZJSzVAIA44ApPhPrfqvwf+k1IsxIeDJbuyA=
X-Gm-Gg: AZFdTZcemxCw5CDbnSliOKwiGkZkvGo5sT3AaX3HYgIL5PjuCofDuVIqvbr0boGmIAw
	FNjGfx7E+hl9bsrJ8Ct7++kryHodklfW5t1YflpuRmeO6g+ccdcOYrxFA5MYrpGZMmj+iWOc2R/
	IAlkmn6WpB5i9OH6vTW1sVVFQuRbqmlpcANi8akWkI3F8tqDJzTjuxwNThGv1IPiDLa1Fv0x3Ir
	QeBaKuUIXHHvcLwqa0eqstuEXDRlvRZpTh8R1hszjsCzZQM6dOnj+htwwlICYcy02jERQ/Cfxu1
	Vt588LSfq94Pe2/kF6d9P4Ts0a9sYBiJ03p4caJimldh8jY+7LdK/1E1MOyDN9sHmd5CA2KvK8k
	z+/cTQIgH0B4LSnPyCT7e4eWerwhzw9agdudasBNvx1p5xjvnsFZrDADICWgCbTVD/C7vBpR+at
	TDEahEUnc5OYW+EWKALLNkRqO1D69kN8ek13oZHIJxBDmeQqf2it6+eaI7SF/udyFfyz2TodFQf
	PmlncRk5rgq0eSGpeBbjgyz4Xz3Ut9OInQ/xRlw315qKp+XAsKGsaIfy61KWQy7UGO4sUn38CpS
	AkYvN0XvzimhSHez+Mg16UPCNLw44dvktw==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
