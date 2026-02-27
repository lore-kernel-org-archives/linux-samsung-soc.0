Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D734888A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210331; cv=none; b=Nx9uXkZspwdeyrHUsMGC2bYYjVMgGXzS3taH0q99a9r+KShzVhBlM51a4RyGzuaDol+bVhY4P85PaFDf9o2ZoCaGmxdRJN4KBCWw4NOk24AZpa8YZDoY8MAp9qhNdtfbYSfcv/CjHXRsLdLsl404c0/7os2hbZAk+LC4HtLKnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210331; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/L/Xtl3mdI8SOMuiOOAgOATI5HGm3yIEy+q5rxigaUYn6bDpBMlHagss5Bx8ZJtefeAKWI+6xWcgYPHSk7XujToWgjQyTm/3FKpNbOQwU9s1QCiiyO29kMktlhfoV7LtCYPIDV9a/nTzQCzDv6+pxUtH0C8Os7vFltn42aYVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faqXkrrx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrXfSlS+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faqXkrrx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrXfSlS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=faqXkrrxX9jDebOGqPS4po+d59RE5auZS4BLM5bIDiAroSemkTkgOwuETJGDwDftOpubpk
	8Br+cI9O8i5FtY2BxMGZYywT3OUxeM2e00hE0buMYnzatoMLaGfWOR+K4u1JHtdetEbX3U
	X/pOeYi/ulTDWhbANC1pLtbQuS9zZ3k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-6z_lCHO_MLW7B6qawuErvA-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: 6z_lCHO_MLW7B6qawuErvA-1
X-Mimecast-MFC-AGG-ID: 6z_lCHO_MLW7B6qawuErvA_1772210326
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b4ce513cso214688586d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772210326; x=1772815126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=SrXfSlS+H0dalfq8l9T4Lj/ORePVPXj2NP2c0yYmqmAPH3AWVlwzZifxXgRHMHTgo5
         FFDRggYKjP2kp/bPhMOLKG9BqrYzyaKe7zoXcTgcKvWBx6VXg7+l9XwHPLksoolLeU2/
         PlylD5Wj4Ln/FIkA5GBQAATzVrK+382+eEpEZnMgIvtY/VkRkCKL4o3ZIhuAZUp17U8Y
         t6J3MQufJWHNq6uL56CvZ7n5Z68IUEFsCS3uthxke2WUfv0hhy81cc7uJoMAk20SVnKX
         6FUny2U8rFu8e7SMQ58W6fzSSUEn8pWAVPd83ZvVMlkpWUY4wUHHIUxmya8QvApqHy5d
         IQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=cUnd7q6IRrJH5ZurJIEWpbLBAYJY3Dr78eaEduGJgiIMMfCK14CCBvqJ+i5P7wA9Bg
         JwapCA1eP1nHkYTX0y+93WJAHjsRxMRMPhtfrSZYTXxEbaR+QSTEIHpuyaWkZQXiSjAr
         4IRoBW87No80iX4u/V7KsRmKF067RXnWHuN/pr53XACSBEalkeWQHXYaph7BcDdPX1fs
         XPLP/P7MppwjlPOfpk5eFeTsllQmot3FITsJEBRyncNuIEnF+hDKYU9ItCOdIO2TRpPd
         EA784E9MhABxGvmt+EGvKX4cflS5/Y46p2vpRNrXerMaBNDXgN4hrhuzrkkTa9ZQJ/Xb
         ZCuw==
X-Forwarded-Encrypted: i=1; AJvYcCVyXySQxy+SoLrieEv1wxmXVC444eN0yQ1wXWnyFJGG0un9eg9N2E9v3TWBqi+ifaVBEJ42VcA6NzJeSVTH87DGbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqU/VZrzMJX9JzTDhN//rELTqPqAXT16GfkkLrd0sQeOB3cZc
	5H5wO4JmEYR5xLIE6ZpOhWnEjXTY7efwbWR13Nh40zGZq++sgSTu/V0yW8iSnMj5FXgxKc1majU
	nP9Pdts5hHUB4JTpLtHmnalKt3VeC6LORrGg6p3NG2SAwyp6LczSy7QWBP+CcL1S6/OxGS+nb
X-Gm-Gg: ATEYQzzG1TiB0fA4my/T+WNbOAMkywpK7JjHlVBaaEU8oPpZ3+EPS5Llbk81O/cISRc
	ZDWhuEncKNyNzA36AtX4Qj1mty+3EgZfBlVb0nn1v3t37fsuS6ftxpxjLuReYuO6F6UJefsEYbI
	8q1d0fnR5ANuMHEs6NLBazrwociFSsRwfBjhDwfoWBE+1KURGbUZ1ObnUwsQ4MhID1USqG23XNO
	DxCldxIb3XW0ATjKQH9xxmsjMi+UPGRNjSiwn9PA34f6MM6bjD/oDd9r8NzK9Yiuv0/hPKAdLaM
	6zwiil6urOPz13u/mDFUe7DKWAtuKYAYjwXxWW7JDB2qaI9rbGIJHJSnehpA7pgp4wF6cClckDT
	KfEw7k/rclnqCGBnLKbWqzTrAURyjRxWaxiYR82WpKYtJFRAhoP9UTb70
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660336d6.8.1772210326407;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian

