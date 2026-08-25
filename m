Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D31481640
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682273; cv=none; b=el8yJgX5OGzniCi8Ml4M4nt9pgbzU6Er+ou0BmlYsdlZfAhZRGjiyweGvQ6zAQnx3XSKoyYiqnEXbFTP9SHOhy6wqZSE7livn7I+pekOiV88PjgA3hDvl4XeiQmsw5guOuqYOSsXNq3uxPHzCwdpADziJzke4FmTOearjwmLLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682273; c=relaxed/simple;
	bh=S3YGTXaGmPCgbv4iCXelKQAvXeOzmCEMabBXbhoH2Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNS3Gv4M7gR/DxIXvoYSlB5VR6A9/bJjiRydMOUPO1woqgW8H/j2LqQ4bfQcUAMUfCVmPmVxq7YQzdoBOBMmoBqCp7E8dVcev5H1sam7ltj2h0FdIfTf8ISxCKkHwOoG4d7K+fgqiv5gyXZ8JLGSr04nBme/Ab18R9haklYRe1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qdvderp0; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qdvderp0"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso95215a34.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787682268; x=1788287068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrSQugjWwNbSyFKJC0aQ+HhLTDBrn6ENKLGPbrFSXE0=;
        b=Qdvderp0a4VDMVBw1R86lx/2BOmy4XgA3c0bdwF51z6M3za5MfLoL+DwBPxkVB+oq8
         CtbhGwQLrqG9uHhbnoUneFTY1zp105K9ew86+c1YGcuXbR8gfyw8D90axWmPsPjC2Eov
         AfxMm3N2/3lWUv0zgpzZ22W7CtD+tnJqO8PICqhB+9J9Li1MXMJtvA4dpV9GxeH62bMs
         j7pmZE+ffqRllGd/OO7rT8TFc0qV2R8mEVJ7dTug1D8DG2sBuJbXjGvzat7TAqmcmw2t
         NKCHwUZPO7sgsXUgh78P7cNRtg+MR5Tz5XrPJayE2GzFwNzNZPI69U3ZnomdMm60uwaI
         L0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682268; x=1788287068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrSQugjWwNbSyFKJC0aQ+HhLTDBrn6ENKLGPbrFSXE0=;
        b=FxW+KTrLL78fG+SAiqHBS+ETJlXj/pFu595knmXTv37FfYfnjkq+CwUS0zBK+zhh+C
         3CuV3oW+dfEdgwS5+/wRAhHCCS29Yd6LDB/pBuNHSI9NPN0WMx6Dl+ckXNPnK/zTab8g
         bGQAq4LvQtANqXXctoDuhV47OL1LTzeYfHEwNuFEoQuVcMUymANqKIC3nbc0tV0SDqo6
         j5Wx35At1VQrY1sopjFdOfd6kUCPVg4cZb+ZUbEWGL85IvK6nrFHF75oYs+B8uPlqWPh
         jqbb/v4k5vwKcC4pAxEMinwV9kTKNm+VTZdTih0ee6LvP9UpZ5JLfvQkHnB835SWB8v+
         lRbw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7RrYlyHsuh/78/YFwtTGEV0JdOmeXxd23A+ZMi36+ZAG6ye7aIzAhKjpr1AMHBSTupEjMdBih2ebUtfdrRzF1yw==@vger.kernel.org
X-Gm-Message-State: AFuF++krURqhUIbu0P4PPgrYwFLv1ISJaJJrRqQV43eSBPlA9eNd3NJj
	1D5CjQK8QrGSlFXJIQPW9kgjSmS01SkHHO6kLMS1y2+HZHCvIwGdtEfmLnm/ynyjOA==
X-Gm-Gg: AR+sD10B11nCduYbS9pXdviKmOAGJAk6mfW2cqLj9KgMUCj5Mx7mVLI8kF/mxBRmgrK
	9qCYQ6XL3rHnJy+qMjzmB7ofGV58g7UEWHoPwkmVu6C58EKaAT3NjUSTwAnoAw4joEm937tAUVv
	4hV7LTxn9VIZWVNwMyRKphzEi0ZRsgaQuED2slsRd1mQFIiHyBSfKO+fBiI1pzECFkjdzRYfCsO
	qheoKkpKkRYrb8vLMRbxgRsuumh45oGYqE58nz2g2ZvycZP5HvtqdgNryQiYEVeR5+5Vd766wWQ
	llDFB+mYNUJmOhwvCQmo6W9Th/paaKYtYTTiNpJRukO9099farA8vwa+/8eTyqvV+UgimC4lx/c
	PjSaf/gsN0Bg+rD06UkNk8UZuMOTHDP/LcyhvB4T728lYtLsjkNORmif33c3Y6Gawmdbu+TBaU/
	U+3JnpPKqj9IUjGgxwzNn2DCNzaLTRdZvdfBr6B8xcD/1ETWEinDlfXVtSdWMin79IrhX5tcya4
	Mxq/ziUswFG8wqUDSzmPOb9+DhM
X-Received: by 2002:a05:6820:55ca:10b0:6ac:a539:bc41 with SMTP id 006d021491bc7-6b1a03e5c38mr696085eaf.12.1787682267892;
        Tue, 25 Aug 2026 11:24:27 -0700 (PDT)
Received: from google.com (203.215.188.35.bc.googleusercontent.com. [35.188.215.203])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a02566desm215005eaf.11.2026.08.25.11.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:24:27 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:24:25 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <ao3d2TlIRqxbz4WP@google.com>
References: <20260710172946.15633-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710172946.15633-2-rdbabiera@google.com>

Hi RD, some minor comments below.

On Fri, Jul 10, 2026 at 05:29:47PM +0000, RD Babiera wrote:
> +#define GPHY_TCA_DELAY_US 10
> +#define GPHY_TCA_TIMEOUT_US 2500000

Do we really need a 2.5s timeout?

...
> +
> +static int wait_tca_xa_ack(struct google_usb_phy *gphy)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
> +				 reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
> +				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +	if (ret)
> +		dev_err(gphy->dev, "tca xa_ack timeout, ret=%d", ret);

The dev_* calls throughout this patch should have trailing newline
characters.

> +
> +	return ret;
> +}

...
>  static int google_usb_set_orientation(struct typec_switch_dev *sw,
>  				      enum typec_orientation orientation)
>  {
>  	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>  
>  	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
>  
> -	gphy->orientation = orientation;
> +	guard(mutex)(&gphy->phy_mutex);
>  
> -	if (pm_runtime_suspended(gphy->dev))
> -		return 0;
> +	gphy->orientation = orientation;
>  
> -	guard(mutex)(&gphy->phy_mutex);
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		if (pm_runtime_get_if_active(gphy->dev) <= 0)
> +			return 0;
> +	}
>  
>  	set_vbus_valid(gphy);
>  
> -	return 0;
> +	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
> +		ret = program_tca_locked(gphy);
> +
> +	pm_runtime_put_autosuspend(gphy->dev);

Here you are using the _autosuspend variant, but autosuspend is never
configured in probe(). Should this be changed to the plain
pm_runtime_put(), or actually enable autosuspend in the probe function?

> +
> +	return ret;
>  }

...
> +
> +static int google_usb3_phy_power_on(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = inst->parent;
> +	int ret;
> +
> +	dev_dbg(gphy->dev, "power on usb3 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	if (gphy->phy_state != COMBO_PHY_TCA_READY) {

I think prior to this we should add a check if phy_state is
COMBO_PHY_IDLE, return an error and change this check to phy_state ==
COMBO_PHY_INIT_DONE to make sure we are explicit in our state handling
to prevent issues with any potential refactoring.

> +		/* Wait for PoR -> NC transitions*/
> +		ret = wait_tca_xa_ack(gphy);
> +		if (ret) {
> +			dev_err(gphy->dev, "PoR->NC transition timeout");
> +			return ret;
> +		}
> +		gphy->phy_state = COMBO_PHY_TCA_READY;
> +	}
> +
> +	if (gphy->orientation != TYPEC_ORIENTATION_NONE)
> +		return program_tca_locked(gphy);
> +
> +	return 0;
> +}
...

Thanks,
Neill 
