Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F2374D3
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712301801; cv=none; b=RpnjTAm6KlKTLXJHcuKV8wbmTtvs7sI3MCWP+MTrSr59nf5qP5I7M9eJoOrP1xX2shWeoKthCU1TrXmUuCaK40nfjM4LSD6NQrlnhT/nGt8Z1IYdx6pH6SuVg6I4Ue0ggCPLK7VeLSCheNyY27utEi65TBGyPUJM1mievV2xF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712301801; c=relaxed/simple;
	bh=8xdKzFa1VnOYKWHALQhOMQPnqmr+rwGwQXGIzJueTMY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=glxGnusr4Amq4xWBadpXGBtdb9uiyNXuMPuvQfgIcohoXhUKOqLVDwnrWx5vIjyPdKvperVIpcknvfywuO1sPa+FUuusRnRIMEhkzLd0J8i3lBpLh1pQM2fm2ABwaFcSZagS1My/DKBwCpHoo5lKpuaiTRrgxoHzkjMJrouMooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYsuHMH2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYsuHMH2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-343e986aa6cso51847f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2024 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712301798; x=1712906598; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Swy2Ymmin5bn1S0K0/BIJr14PVb2mCYW4gABHjS10eE=;
        b=iYsuHMH2wacPBIrhP7vpfKm3ie5aWDC8vy581v44MsGa0iejOZgTjgB8zsV50f928z
         MDsDT3KZ4vhT6uiYVfUJRvccFJqX85GZB03Dyd8GixTk4c/i4j2Oq/5dXgYFwLTIhofA
         uzIUTzKmolcS8KukNH1Lpyv8LNLyCJLxMfbEygujQLaXedhZEnkWEaO8AfAlDmCK9sgp
         2uxq6jjgaraDqg72slWfsVZlTOmMzDuKUgnl/uPLwvajgtwNRFCnWdrVLNOHlcfgwS+y
         8nzr0TRTw1Li9UO7GnDN/T6hwEFO1DZcKfovNgXM529cnMx1rHrej6E9rSK/qX2ewf5w
         rF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301798; x=1712906598;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Swy2Ymmin5bn1S0K0/BIJr14PVb2mCYW4gABHjS10eE=;
        b=Iwa8U0Fm4L5EHuyqYZkU9HdKwuJ+YY0EPddjgvFtIX3gYkQRpNQLb2r3d30QPGQv1z
         sAfzzBnD//Y1MDXrnMLd73zWZrS58q+OV9ovvPgRNFLM9IgjBgUHhZRNOileyVanNK0C
         36rXlnEXwsM5MFjZnXE1CbJKiyuOC3320acZLI4Pxbtu+okdsrWYXuaaUpyGcmTnLMLp
         KbknvlykWUOnwkpxpTKDaVdiKI9cqLOlE0gfxOZGqgPVf6ZaG2adOKVjNevAoOAH0peI
         5+uVm9iQyv+jmwZjvHdUUUCG8bvhETyemAO+GE857PNfr00kzOs79kMseNGeSaiTKrFN
         07EA==
X-Forwarded-Encrypted: i=1; AJvYcCX7dXO6mQuPrQf3GC3UF/mCrB40Z3yY2fRp4jIjxUsK+j6COqcKK4UiXGYcL/D8sfpXRKciTAFogwekJXsB7Y1V87/aR5FOUWZHoa9PZ4EQ4Ys=
X-Gm-Message-State: AOJu0Yw/AcuTcPnufa4NrOoAwbkMNDp3mgPkdfArQlC1vrZgkNM1ps6Z
	hHq4G0imCm3ZtCPHKQ/RMBwJyxj5aDkYgf7RLpnyYKEYW7CVqSz+zUH2qA3+16A=
X-Google-Smtp-Source: AGHT+IGFYhmbZFEXBcvSW4oTAKx1TZq9kP46lHeI8Ljnkc838zmC3DM9SJlHsNvNEbhOX4B03Xxclg==
X-Received: by 2002:a5d:5918:0:b0:343:6f88:5de with SMTP id v24-20020a5d5918000000b003436f8805demr424276wrd.44.1712301797816;
        Fri, 05 Apr 2024 00:23:17 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm1312626wra.36.2024.04.05.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:23:17 -0700 (PDT)
Message-ID: <132435ffc0eebed9317b346e880c4a69f09d6839.camel@linaro.org>
Subject: Re: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:23:16 +0100
In-Reply-To: <20240404122559.898930-9-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-9-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> index 3dac3577788a..ac239ce6821b 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -518,4 +518,67 @@
> =C2=A0#define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
> =C2=A0#define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
> =C2=A0
> +/* CMU_HSI2 */

You need to add these defines as part of the patch that is updating the
binding (patch 1 this series).

Cheers,
Andre'

