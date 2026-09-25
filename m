Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD174FECE3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376508; cv=none; b=cuufxKT3BVd8o0dhM0sqHY+k5ufBqt3Rv8EsO3WwcKRLIK/ZAsa4ZzEdP3lCy2QYpHeOclw2LBCzyHRvzHJsEuGQh8bmpxGimIzb5jFmAC8G8a56/EqqvW9Gr2Ab9Q+QBsRAMkgqj3ZKnQ3xkWHX/0V2izWzzt1E9Y8aRZni+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376508; c=relaxed/simple;
	bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIResjHUJ0DogMg45Vjh1MN/c8fs6J856P49h5DNcmB67FGUWdz747IfpIo4+hC68dINjimv5s8RrDUQve7ABFlsEFoYCWSgf8GMsbH2x7zDeblMQFruK4GRiY3AU22ssxxnDCgDFErvLUeArBbLtyDnPsa6X8n+mvp2kbaXNKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NW/EDx7n; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NW/EDx7n"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0d298caso876883a34.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Sep 2026 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790376505; x=1790981305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=NW/EDx7npGA4lAIBnrRyNNM5RcBcnI0sr2fOlSEh/L1K6KMCIfMlIyAksSCndzqsSw
         /dydlfVIAVHVJ/kYvkpHiiWfkvIA6ukyoNqgir5c4S91w/9L8uRKGk4RYnuTQGqynAW1
         CCclBLPSC83Y2jV7XJUjff1KKmgrBk5QqPvhB5wJnntLcFQMd53hhiCJOTjCN9AcKKDQ
         sF6tfiY2q7VdfY4zROi65S5+/UUCiqaI6JHPft4EdeFE4c479JT7E63duqoEaW0jMUce
         sMFXtcbC2M/WwQgZf2FidTJxmZ5dTegDwWjJniLpHEKW+1SY2L+utVk78L0+E27xcI2S
         Cblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376505; x=1790981305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=QtWp/JcvPfaeB5ynIioge9AobT1L2XjKbIeW3yY+aw2g/Uad58ehV8ISzTU0i92Kai
         BiTK7UpnprftdjST+Zr+B+WcVa2Hon4GhGOU4cFxfloKWUhpHN25LPgB1t154hnNu6qK
         GCOqomUyqqLvdqLHLipGwtApKe6t+yJE0zr1k2sPTyvsdVC8DgsnfJLG8S+TuJ6yVS1C
         XDrja+aVIgOxNfT+1mIE4Lb+H9Sg8CtBC+fkps6/HUUw4m+VLQQgzoxiabUpFSX7VoQg
         /CdeVDTWryMm3P0ALTweQBRQvHdnkpGtwr7rt5nXktiQc6fUDtTqx7kVOkjuvKdcdEX4
         9x/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/UM8gbui05VHPEQP4zsltclg6BQMqDrnB8Erdg00LVR3/cw6JnpeYUOAenK7c4qjrdN6y9WUdrViJM3tRwTaNyg==@vger.kernel.org
X-Gm-Message-State: AFuF++mEZARDmwkN0Ha1RVHGfSyxJq/s9xEhcMxk7tR0w+XtLG+T/MTU
	v9TQtecanWmbHfieEdz+fTRIBLsfug5OwnkEUS+/HpH8IPaCG4vyZ2hFpmmQ6smEBEnrwt92Avl
	lvfSlweS0
X-Gm-Gg: AYBFou2+AERRPlEyBd0xxSUDtB3k+w/ruFb6LTrVPFzY2+mCO177ZJ+aBiTVs0a89qS
	5HKB7mjVqvs0RdFMiBXPAmt+CoDB1LL084nrr+BrNj04/MW620BbBEXgcZEl5aGjFaW2frm/DFI
	m8YWu40TA61yBmlWaCWURgmMOln9oyimjg2kxbvgekz7QWLGw+d7sf3kG66Mxp3OGtqU4qf3iT9
	oI3L/7pHveCBKYIsfs0mLMTzFDCd2leMkpk6xdVM+NKswb80uXC/nwZU024bt8rbsCmCiu8wo6+
	+y7KTJYlEiR0N/O1vPAAxU1td+cvjlSWeWpyCduo1MHWVawu/lpmzOCqy+r68YIzw5A700S0DZF
	/iWyByhYXpdNFS2dqqCsx2dHYPrgaZ16CkFpeB56XxR3CMgxD+EXsniRjbQb3uN9oYZPiL/W7W+
	VpehGUPhHo48sUkRUcbQ85iiA8S5aOx894pMYCg+Y/mB2mKMR47psa7kvV0pxPY7txJFKuOFF+m
	zjB9YQvbfw2o7zIOE0OnZtTLd6B2m8dBF8pbGxBNzHo3mc=
X-Received: by 2002:a05:6830:4425:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-8178168df1dmr7919471a34.13.1790376504752;
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Received: from google.com (222.97.173.34.bc.googleusercontent.com. [34.173.97.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-819471d2bdbsm2561506a34.13.2026.09.25.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:48:22 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <arb6Nn1Yy5_1u00w@google.com>
References: <20260925222959.3607769-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>

Thanks for the clarification on v7!

Reviewed-by: Neill Kapron <nkapron@google.com>
