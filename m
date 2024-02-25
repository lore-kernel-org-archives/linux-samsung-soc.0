Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997D1BF35
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877472; cv=none; b=SzSN/9oBeDLZSt0Ss3C4PkUcuANeN/pZ/J4coohF66uNxxAQ3jAyQGx35qKRYxlB1L1Ini1avuwwTzWJ/Q6x3RhohwHh5FgPANdGbIhGfp8qMIHfhXOuG67tOLGacesPp+fDjNVxZIqJBzUDBmQWPCuncjmC8p2pjmZdYaVeTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877472; c=relaxed/simple;
	bh=cU+ktrd9n1YdiXM1Kh/vgAaMqYKS0NvqKmr3Z7+AuMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NCDNWj7i1JPQ9QEOFcPz40l2xJKAL5Vf6gcFyKu76aCl2jPd6NYPvemhtSJd59PoQmgP3aPippbObya84ZMb38OhbB2ue7o77zVefcqALY7XeQ9I6rJJ0O8iT+m4NmPz0Ywae8DLHWZrH6YqHbSbr/JC5K30LcGRadcHVWAMZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kct1azZu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kct1azZu"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so24561291fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877468; x=1709482268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KXVaOKFr5kvye95hXniuMdgC2oHUvYmqm0J4NG2OIs=;
        b=kct1azZuNZxGpkqxvTy7dbvBPVPOhtsIwwCCmYpacmIRLhtEFFNbx6lGmv489CTbBi
         4AT5qYVyHDzNQRm1g0+Ux9xsAsmrIfM6HXK07ofOoo4BLHZvJVzbGag1fSZ33GQtloY4
         gmCgEJOTRqlErRQLjg/1nDLaE22GjYIdgruRTiuSL5AjoUVMFtVATWIZ+iuCK+1YaaSL
         ARHXBdLcmIhhQUQPmIN8X1rAbC/ZC9h6vKl0T4B0Q/F59rfFw6T76wYatzFn1eP8b7XR
         E9wV0FuBpDZSI0TbLkQMPSlOkbSl87Pcx2P1zuXCXn/wfxJNQC4YVbsWIMdVq7DkN9yZ
         RkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877468; x=1709482268;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KXVaOKFr5kvye95hXniuMdgC2oHUvYmqm0J4NG2OIs=;
        b=WzIuZxNcEnThImurEPcziIxA7QuNI4Bm8FshgDT50I3/xJJGtAy03rkjreLAEBTCpQ
         CmdOY69tQ+HY+ruiNM+1T8GI1wLCG4/s2uxWQdkiVBPAEuOl0SqI2Ya8wZ5+AvdjPFeW
         KHJqpIlFOLkt2Uy2focBbFmC8BA1rCns81o5+xtM22ALKINfhhFwmrRepAzL7fjAk/ps
         SGWJdtM810RLZ5x4RdhXlZN0ENpFViYFh5Pw79WWfuuQUvGE4+7EGNlWWBOUdicGG6jj
         GOjzJZpFaxF+FyzlHNZ9pZPylukIQ6QJK2gEybj59B3JKlwvJ0fRBxv9G2iLzFf23fo4
         s70g==
X-Forwarded-Encrypted: i=1; AJvYcCWEZWZhG1nvF7gNDuWbrHaa405ivkErKKWrl0aSxBXeEC4P8vUdk65oQydgrbUgxwVQ9e9A5PoazctqC3l2D90ZW/lXsD8VCpMpFP9ujX9zbYk=
X-Gm-Message-State: AOJu0YwhWKZqamUSgWxh+SIINrZ4u9o5B1zNyp1183qJd+nW9jf/qQOq
	NZHBXlKO0R7iLtiWEaaJGsxNZ3nGKTOXMTHgstYR1DqtO5gxtIH5HAU9xb8WhVk=
X-Google-Smtp-Source: AGHT+IGBSbDT8sCsvS0w3yvOiCct9/Bh/XM1WMHea5PKYhnydcn6owioy2ov2Yd8mpPObPaj6UGyvg==
X-Received: by 2002:a05:651c:220a:b0:2d2:4374:b71 with SMTP id y10-20020a05651c220a00b002d243740b71mr3393789ljq.11.1708877468468;
        Sun, 25 Feb 2024 08:11:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-10-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-10-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 09/15] clk: samsung: Keep CPU clock chip
 specific data in a dedicated struct
Message-Id: <170887746655.215710.9580664950836563273.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:47 -0600, Sam Protsenko wrote:
> Keep chip specific data in the data structure, don't mix it with code.
> It makes it easier to add more chip specific data further. Having all
> chip specific data in the table eliminates possible code bloat when
> adding more rate handlers for new chips, and also makes it possible to
> keep some other chip related data in that array.
> 
> No functional change.
> 
> [...]

Applied, thanks!

[09/15] clk: samsung: Keep CPU clock chip specific data in a dedicated struct
        https://git.kernel.org/krzk/linux/c/9c746e5afdc3f784593c903d4be3d418f75d7787

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

