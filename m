Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA5375AB7
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713801; cv=none; b=Vg9Hbr3pk8AUx+MYxPo3CoF+nSXNWG8gpv5zUxStgl3vpqGk+3q9aI1pL7xHNRXbFZPOUbzdlXnDejiyKgbR9fieDd+/zxztvBIFeXdlLBV0/X6rpGAKOJ8VSpBhDvQZwiSmTd8tSsQGbMhr1/Fop4yE8Ae7fsQUnQ8EAWptBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713801; c=relaxed/simple;
	bh=4D2Q39ZrE8YmvazKvKW3aF1/g5Cpv43ee/MaVGKVTBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUh5rzlX8ktIwReC3FqDg6u4PcUSj6zPhtTzp0X1ifp7SXN1W1vQxv73sFaUx0kxlYiHZV7Y/k2v/0rioi1BKas3WFTTkRHfbfDEHpiUwFcGlohVFolDw0f+tXu9W61hvAJXkc9JsQXM5JS2QbFMygvoUoJJngobeIEgL3PwIM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso589729a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713799; x=1773318599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
        b=KXI8dHi4vFfMnysbRUN1+pCkJ5/7aDDBOqG2JVQvM1yOMZfUk826yn+BpMydBC1Qym
         AO4zVElC0yjdxwNazVdesCVZHgIepitFYXPJ2K83el8Y3HWrd9DfSEST1JEVXqe+BWhl
         Vs+PshmiQU3DiWrmu7Q8SPdJ04A5FEGO8fd7/v3wtPLixb/Hg2X4waEpTQiEyi/TV/U4
         TYiE8VGHcYzPMDfYz/OxZJRIxRUCMK6e1x3y9Lull8Z12jqGGTItBuLclF8kdzUXMQs1
         +dKxvMPiAe/LgaoQH/uqhMtsH0aZuucMc1cEa9jMoEWerNArLrS7yFdUHroLx+11Wu59
         YceA==
X-Forwarded-Encrypted: i=1; AJvYcCXmWnmCcZgYBmVvoG0CMgSNqiCEGpbrmuc3XAUm6fTSLsaXATN+fhtH4rIS9e6r+f2ICgUIQUMb/+c+InLzVxKyuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkI13wZk4c/XE5/OIuTe85VKngKVkgQwYon98nk1qu5L1rWlnd
	uu168agQ6FW1SemrxQO+i1DTP9/WUBaLVsxOX9ZD05wh0xqeqr2YfrYa
X-Gm-Gg: ATEYQzyY3DZl3Dj4neJC77m6qJradDn9V93yCL+GpBKe9JVTw6mOkkB3YDFV5+FMRNC
	u8UtFgr2UNOvgouqcY4DOEU6t+rvt4AZdyPHRGiBRhqm07Vw/zI6phJ8uoZBPvDYkLz+ludkKGU
	P5URHr8hQnoZHChs2u9cgg9w+oulj96tyYz13I0EMA9RTOBJGibcYh/fm0LRbbw65/b4pSP3QaR
	CoiNtrXtEhrwTgyr/cZgZ6kS2ep22NB4qh6OtlaRTnmk/iH620rX18bBKDLKOun9SRY4UoJkQQ1
	REb3YzgY71KvX0MwmpNudumSQskYJusFrtXvgWFfYU8tvcYhkoKaFiXHuYVqYB6vpl8iQ4a4EBb
	c6r14ACFIzq8QlFRTaI1D099sWI7B5akB8GzCvnEmVMKgrzA6P3DZOSJ4/9HdwIFm+s1m/p18MI
	uSoPsi9kpWTkRx2KjCIYPYKYPe7tDavUNop018wBPWvSe4Kg20Cfbi1QQ6oarUCTQl0hPujQI5K
	4tLUMjsa5Kp9d5Ijrlq5N5UTrSFMvyAToU0BSWZm9/A63O+tlQ=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017;
        Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof
