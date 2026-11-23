Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412095;
	b=iSa1TK/EdOEochOJJvA/Tl42ZV1fJZPjAvWhUigBd1kN7It3BZPPG/rGMOLYL+cnxAbu
	 tVuQuP4ZNiSRd+vOVXsJkJwNJ8+xZexYUwUTzYvfgI1XosHEDdFTmkGJouQIJfeJV8f4e
	 oVvzen7abAjkQopYM5z9xuohd3+3FT7jWgg/JjDAkgKfz0duoZy6WH2Qg4HDUv1XDgaak
	 NsUfT38n3vQUSB/KQrGfnsoaX6J38b0sKTGbq0R3RyQb2IoMeoRHHQUDSDWwZzjuVpxFO
	 lYY8TW/lKEifNWXjk9iXsKpa8XiCHRc9MIXiFG8kOsNIElWHDW4qhIj8xugsDE7bgNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
	b=QqqhjCbtSkWoMgyRmrc3CI5TE7+4S5/JdZDLvmOuenh6zChurguJOo9OJ5SdA6UurHqb
	 l6z8eJje49yQ7/7bk/V4tDe554IpBMpR/krSeKHeQJ7nD9B0/MbwQnnsjbGNUd95+bRYq
	 qrPWiN1DbO5giMKLls6LF8DYNfW+LNplHT665DsibbOz6ogHpp/hebYHLw2BUyDfn7oxa
	 6DKLv2NiQid6uj8Q9y4oaS6ZsfhMNLvd6XiZUJXSuD5ivqFwsQRXvq6q3Ulbp4B0DluR5
	 +MT5z4FGgpkidMHzV/tkzb3dA1cz4nYqd2KBl/iiALYAqsUmkT4QmRIgDKPyitJ10EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zRhWVqwP;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DEF606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zRhWVqwP
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b546061d58so6584477c88.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 21:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795412094; x=1796016894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=zRhWVqwPzRdS/S3SNWc6pwEH2rZiRiN1XxRt0Y7KM5Q6Fi710yUMjd4YtxarNqt3OS
         ktE28kOUcVycRnFnsqYdBhW3ccFDE1wODV3eL2dtbGGTHezxLtT2mi7jCscT+eRY0PxI
         x39GN01oGijKwbCMqk7V5ytBwIuYGuF5Q+mleloxdbRncsb6FVZXYcIFIS+ldK3FiJ9q
         5xrT4mwHcTPMx8s7k8COAd4eEHRNDdgFl7Hr35FkJfeH5vElDmse0ofxLKthcp+r6qVe
         Vc1kU/gWiYRu3zVYp0PRZC6n63bq1EVi76ixJhkMxZ1tRdvtpV89u9DsHRRSFKuk2qS3
         TpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412094; x=1796016894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=fuIbYje1YKVMIBnnWvZNpA5YbOHYrnGfY1RzwcbiTA28Y91sXe5Dse3Et1paetjy3+
         kOn9V2iTVZvSKJxrWGV/RLEfOPaxzeSmEp/P+DQfpUr6809X3K7rdAAps3iOR8eTF5s+
         gIdtR2GAAsHY5ta4Vd6meI3BPAMY/neZ1W4HXMLxG0khFgw1zr2OEUxoKgoBAED20ThS
         krdq+INISs45z+0zWhLUlGsBVd+7if3Pffw7KohrWkyWuZWh9J068ZWMl+C89Whq7SCO
         rcOdkKuZhXD4nvlYHGM7MfkOAEfjN9zQ37WHSYNMnz8BJOIcRozSs6lC3nVROnM8jVBZ
         NDDA==
X-Forwarded-Encrypted: i=1; AL+hErG5v8i0aD0uiCch4VLBewPjSOcVMuml294pvw/x+ZKqD44zSpA8osAqQsUx6Rq/27LYumBW9virLAMEHiVg5oq4Ew==@vger.kernel.org
X-Gm-Message-State: APuU4Z+m8wo+/Re5Dol1DhKVDBpYG0YlOEQnm/h/KM5Jg6HDZ2FYK+JT
	wGQv3KD4lRhF2BHz2JQXvCMHMQR3nnFw27ziZ7M8IWUBMyOycs251Pr76BOaLvyJ/bg=
X-Gm-Gg: AZFdTZdQYKXJFfq4YbkofJbhRIbuI2gJMLaI0sebnIm/iV/uUe95es8QWpHgkj0J/Ni
	sGaaYWgsYLxscQTG2EWxYMrXWjHu8HzdvQnTguzbFXOJuAGIG70iCgTv+iMfdOFPzJL9cEXeL3D
	UO0McAARlYplcJLab8HhwoS5vEhQCw3O7E7AVI5deJ5IQA1YUzEt0Rw58aTpra9hvSCOrhNO1oV
	Hp5hFqOxjsCvhtvRgm9qnGbQppa9F/emDeSO+FcIUEDGqt1RCGzrlLaroFUkvMf+4FuGOvJBEBG
	2mriQkP+hOwC6ZWjyJWR5dh6e8w6PMefDlVNRzzh1QD2/yUU3luEtTWWjhrg2+5d0AegFQ9Ewfd
	ybNFJFEp3E9RLGYfU06BCL2MGJdgUXSPAKeFkLRNSjQ6a7verT3souXH8UBOCSOeKVyprRYb7Ay
	JVDLIPnGpdL/j33HrDXSkRGKqelkSzAmqvF2cPFrQjNKDDj13OPNoUxYJssUAeZNmFA7vXNPE27
	qrG8ERxWyWUdIo9r+Xfi0KFMwVh+u9VIRRms2SAUv7UqVJS7ekLNmyPCKuTE4aLamMt60IWc3yf
	xqrZ53P5R1xsn8kEpO/DLO3IO2qUBg==
X-Received: by 2002:a05:701a:ccd9:20b0:1b5:7351:955f with SMTP id a92af1059eb24-1b573519624mr2091488c88.27.1795412093505;
        Sun, 22 Nov 2026 21:34:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm23537896c88.0.2026.11.22.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:34:52 -0800 (PST)
Date: Mon, 23 Nov 2026 11:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: shyckless@gmail.com
Cc: rafael@kernel.org, peter.griffin@linaro.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: Re: [PATCH v2 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Message-ID: <awPQeliuPmaBF8cG@vireshk-B250M-D3H>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>

On 23-11-26, 05:21, Suyuan Wang via B4 Relay wrote:
> Three small fixes for resources that are not released when a cpufreq
> driver fails to probe: the cpu clock in highbank, the three clocks in
> kirkwood (also on unbind), and the regulators and register mappings in
> s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.
> 
> Changes in v2:
> - 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
>   from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
>   leak (Zhongqiu Han). No code change.
> - 1/3, 2/3: unchanged.
> 
> v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
> ---
> Suyuan Wang (3):
>       cpufreq: highbank: Put cpu clock if clk notifier registration fails
>       cpufreq: kirkwood: Put clocks on error and in remove
>       cpufreq: s5pv210: Fix resource leaks on probe error paths
> 
>  drivers/cpufreq/highbank-cpufreq.c |  1 +
>  drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>  drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
>  3 files changed, 22 insertions(+), 6 deletions(-)

While sending a new version, you need to add the tags you have
received so far. Please resend with Reviewed by tags you have
received.

-- 
viresh
