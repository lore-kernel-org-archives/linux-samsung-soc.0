Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F618026;
	Mon,  5 Aug 2024 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722861783; cv=none; b=byIIb2Fgba6E5pI6wXV/oho2HmA0Jj+dyCyaSDUyIpjwvXP28KywqmFmN5yYTNLRYiI1qLnGAGL2fhATiCBcfDD3uNHGNdMir6gB00rohA4X9qrQNijApl5nGgceAd4pBsWlT77psqAbYj2pMZYSYEDQtGxISxpqzu8/G19nptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722861783; c=relaxed/simple;
	bh=YW/qg94iZPhUR0tp0hVHRnEk+cNH6Dflx/IRgbrrdEg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agVf64gKrH7TvG+noxxKa3hVFRRtEbb4s/yudJ0rbznLGxLGtwGsmuYe6K+vp6mtov4A17e5auaMr0kdiITcAQqT8bXrOfBb/G0zV/7m9l4DdW58xGGOQuqBxVRNmQyMSnT7tfhXVha0Y34SaZDv8+QLJ0v9RD8YkZjX4xRoRtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGoICLhP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGoICLhP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso10828713e87.3;
        Mon, 05 Aug 2024 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722861780; x=1723466580; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YW/qg94iZPhUR0tp0hVHRnEk+cNH6Dflx/IRgbrrdEg=;
        b=fGoICLhPyAVMHwnKk9iRx+P9eQ1vjUYwJxG/VMA+KWNuLFpjzxh9OQtPuM776EK7Cv
         Lu1vS2ITPcAViLqRwo/llvfkjf0kJ3RWOvvbPTx/ppFbdNoxobq0zQiitE2wxh++6Qni
         iTj79S4NLtwW8cZCfc2BS52r+FMxQXkY2RmgyzJb3sG93pS43Na/+QCUnAXxA3HEHuUU
         ngeb59o3W3fY6vfuK+N4bg0/rYQJ1bYQ97yR4HVzzhyGVaMeP8l83GNFjcRtfXstMY+9
         N4werS22uPi5m9P6X3NVXglIsCZ3uXpqk1WRapeQyA45lJWkay3zkNBganXN0tesxcWy
         Yrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722861780; x=1723466580;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YW/qg94iZPhUR0tp0hVHRnEk+cNH6Dflx/IRgbrrdEg=;
        b=NokhRQYsBbMkjJEckYHbiEs3iGj0giPIateWtZdMxzO41KjvwxAil/CcnB1A97jf/e
         vIgudV5DLKs5eVFDv2cJejhaCunoGO34eVmnBLcCBGM4RBQiLaI8kcgFJX+nh0mhfGBk
         a7c98WlhGllNYQbx4p28unD817ErFetv8+EIU03KtLdj25YB9ERvkVMRc76yRbTqcJNx
         MQYHHXv/Z4qGDptI15rB250z2wPrkYN+hn7IqmpTBN6eDFFhSZjDRRBCmOm157JZUSS5
         8ZZpkpM3s52zufYxipZt+Q1xYJplEwg3ML+0D1baKHAfCtujLXpk4emOCz8DJujLOnBY
         ypgA==
X-Forwarded-Encrypted: i=1; AJvYcCVDKOtlymDJRrpcU4F/ABlMDWpabHjxJQ/uaUe3L+u73maK3E+bhmAyzFJkevZxhfbRdwgzcPEWnQJFjUWxCA3A9yijeY712uEFF4B2q7BXUgizcEFbbb9103E5FSAPhZ1t91mt20I10oPDvLpDLvG+V0JHpdvyE/PE57ieaShEWggFTBC/rX+mIFMWO3YxVNDcM3mJXGmv/CtXEKaqCEAo0rTdRPkcdQ1wvle/dwWDDwwiQS8gWQvz2XkBbQlfGMNe
X-Gm-Message-State: AOJu0YwkBHO9UdV4CuMDfFu3ZfOoH1sVwS/IIqe4tw8pCoVFE80cH7ot
	uHCgsXN5wqITKkHrvx9BWZ9OLc70PH+cyy++iG/UGWIcndMR9bC0
X-Google-Smtp-Source: AGHT+IGrn/fiiMQfSHP2zwcfkB4NJ3UgsNTVBkuKqly9QoxA5DBgXyicWcuWmKSOBQoaeHciBly7ag==
X-Received: by 2002:a05:6512:398a:b0:52c:df83:a740 with SMTP id 2adb3069b0e04-530bb38cfc7mr9005249e87.30.1722861779774;
        Mon, 05 Aug 2024 05:42:59 -0700 (PDT)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3d14sm447805066b.22.2024.08.05.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 05:42:59 -0700 (PDT)
Message-ID: <5af8048741215bdafa5d8f7bf6ab8dec3cd7aed0.camel@gmail.com>
Subject: Re: [PATCH 06/13] clk: samsung: exynos7885: Update CLKS_NR_FSYS
 after bindings fix
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,  Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thinh
 Nguyen <Thinh.Nguyen@synopsys.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Date: Mon, 05 Aug 2024 14:44:01 +0200
In-Reply-To: <bd7c76a6-b7a5-4f8d-8081-95b6cdb39186@kernel.org>
References: <20240804215458.404085-1-virag.david003@gmail.com>
	 <20240804215458.404085-7-virag.david003@gmail.com>
	 <bd7c76a6-b7a5-4f8d-8081-95b6cdb39186@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2024-08-05 at 07:49 +0200, Krzysztof Kozlowski wrote:
> On 04/08/2024 23:53, David Virag wrote:
> > Update CLKS_NR_FSYS to the proper value after a fix in DT bindings.
> > This should always be the last clock in a CMU + 1.
> >=20
> > Signed-off-by: David Virag <virag.david003@gmail.com>
> > ---
> > =C2=A0drivers/clk/samsung/clk-exynos7885.c | 2 +-
>=20
> This needs fixes and Cc-stable tag, same as the binding.

Would it fix ef4923c8e052 ("clk: samsung: exynos7885: do not define number =
of clocks in bindings")?
Or would it fix cd268e309c29 ("dt-bindings: clock: Add bindings for Exynos7=
885 CMU_FSYS")?

I'm guessing the former, but technically the latter introduced
the problem and the former transferred it to the clk driver.

For kernel 6.1, this fix wouldn't work, as we'd need a fix in the
dt-bindings instead (perhaps the dt-bindings fix should include
this fix there).

How would this work?

>=20
> Best regards,
> Krzysztof
>=20

Best regards,
David
