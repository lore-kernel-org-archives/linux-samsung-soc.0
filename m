Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED3C2E2829
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801281; cv=none; b=g1cZMIJ1xqf0RRlecOGNgKVu74YT6h7hwLgz3dzkb5+DvMHS10C977b8kvGRn2we0qzgE0H3LOYIGg20vr594y2acQ702NUlKHynKmSTy0OYovJzbrLeIPczPHk3YwptVS1oFwzYgg3jMci/sgYCwy07jav2efDbImJ/dpKix+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801281; c=relaxed/simple;
	bh=XcXSdUzKD1mwXL/9Can636iXduhuHzRkLnWqXVqBSRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdOlYvdxb0y2uzs4u5O3G6F3EWjBcY2pJvtYYFZlOIk+sEsTycqzMPPQBwO3VzbbYFMlOZjVKACtPjcD9VRhM1BGYStnAKFnxIhZRWHBGRkBVYRcIkCze5VdkXnA3KFI00W+p6oUdwbhubW6kabnlzWOFV8tWtj3VOPTA0ncMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JdSAEXpa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JdSAEXpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
	b=JdSAEXpaFGZ/sTErFkF3PSMmCQEM9xibsz8uyiLJrXb6+ZMdVrp1QFe0yVayR18sEjxCTy
	Sw7bpsRUaHZX005KN2El57czkJKIJGdKLBsZzarJ1tzgF03fL+CxOYKay0MADu3gkTjFFU
	jVLfuEwwQWb7e34pXrdIUI6TNvze8Tc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-YPV1xZ1aP9ulFw9YleFGSA-1; Thu, 21 Aug 2025 14:34:38 -0400
X-MC-Unique: YPV1xZ1aP9ulFw9YleFGSA-1
X-Mimecast-MFC-AGG-ID: YPV1xZ1aP9ulFw9YleFGSA_1755801277
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d7c7e972fso18490106d6.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 11:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755801277; x=1756406077;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
        b=DDGPcEWg7CG1TXrFr0PVgSFmd9/+N/jeTBIuP2tm5r5j4Hyvez26ACOR3tKgyih+pw
         RUxmS66MVc555ecgyxRVNIVuMAZ0iALbrM+erAohZ/rTvVT8+ISH90bd/llzJcGrDWl7
         HOxmYUtnE5RC+bK0hxefHlGQNc3taUqXDd4YC4hu83A0U74Z+kVg2/K21LEoqcV8bkV6
         kUHPV16AYtikYSy5TKKRZWne/0WurC8QWJakjyZJyDsqSEkpBLxcYJy9IXOUzQlxeF0K
         CSvy668bpkiBlQGGj8by61CiHlB3sO2JkrvnerfOyQ61OeMsPGP5X0ZIsas3NUdoZItx
         Th5w==
X-Forwarded-Encrypted: i=1; AJvYcCViJhTWoZ6EjQg/QTa+KRT06SX97EzPoocDxvHAzbmvCwx92l/8o1FDo8PPZsLV6EreSiyFab6t+r+YMgpJt/F36Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHO1cPXcQFkxkw33kgGi4fP6pKBFrPykgwbR5iMh2hAQqR80yf
	bA6LhdruM2BCfeGk3wcbsEzPoStiCS6nIDlHjwGBez3HUQUF58sF6048k2vxMFaUk6rss+bp65U
	vVi6jR4JxF/FLQpK3T/Td+vVRmuywCxKjxUD8KVqDeeLnVyFuuYOf/eL4vGXj2N9iEc2vaXjJ
X-Gm-Gg: ASbGnctxFyp2EgdTewuX7wVP8Hc4Exv2QuRT/VvbiuYzjsoOPNegXVQvjdrNH/8hkEe
	C/4MLZfbloJgfaKiabLHlHAdjY6cOmNI5y8dv7Y3iVwZkIJbD8iH5B9JV6BW04pIVtRXHoEPSDu
	vr6Sv+Bgd3AGrSFaaVCCJDGxkK4TvdmgjNrLOoMay/r9F1N5iavrnewP7ZL8mvr0GgtNf7Z6HHN
	fYMtQeSdFFbeEU7CJ1LzB0nDTVEpnzpccEUETRXTsHH8uWYk72DY/xqnqdPMDIwd96CIjg1nodi
	hQ50dukj+wWrKspKjekqR8mD5GSGI7Gf3FJzVJwPckOsvpEyWURBJCPrpHvwTKc=
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593486d6.36.1755801277410;
        Thu, 21 Aug 2025 11:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGhBCfL4CK1vaEmXkCImS1C3Q00vXihd0Pi1g9BmtPkaC8+Yz1YnsuRpshrKZpYpvvdxsepA==
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593076d6.36.1755801276990;
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba937390dsm110337596d6.60.2025.08.21.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:34:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Message-ID: <aKdmurrT1pFtLSI8@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Tudor,

On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	/*
> +	 * We can't figure out what rate it will be, so just return the
> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> +	 * after the rate is set and we'll know what rate the clock is
> +	 * running at then.
> +	 */
> +	return rate;
> +}

...

> +
> +static const struct clk_ops acpm_clk_ops = {
> +	.recalc_rate = acpm_clk_recalc_rate,
> +	.round_rate = acpm_clk_round_rate,
> +	.set_rate = acpm_clk_set_rate,
> +};

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian

