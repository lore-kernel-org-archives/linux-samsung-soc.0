Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847F370
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Apr 2024 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712694745; cv=none; b=Yevul26goGp5HzFbYYlE3dUxhXyhxEMbJ3XTNO60+0WuWuUX3ErkZ00lE/MYj7YI0so2iS+ZfBfM+xVPV4dZZyGzrocLKiVnp7H3HiY9zE/kOft2Cc/puKfa6y/snWOO8mWGZWDrLnPmhvwQI9C86p4CUCBSuIWJ6K8tMYXsu8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712694745; c=relaxed/simple;
	bh=qmPSipmsApE9MjLQLRwFM2bTm8/5nzv5gy1HnTd1h6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3aGeeVZf+5P7l01JKUh+6+nsIWznRxOSlZ68B1P/agwO1+Itm7c4f8k8usmWT7OK2s+zI1nbOsJkfflZDP7wkClVHVQNXC3fgtyc7V1JJQ4zgX3gNfuTUwkqKgIdGMwRwy77u3lOAixqLK6NFylGXm4J5nvF2lXPBrE9nzpocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EH+HKn6r; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EH+HKn6r"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e3c89f3d32so14515ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2024 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712694744; x=1713299544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12JndML8/JCJgkfhvekK/G81mXPrA5btch0gZl1J20Y=;
        b=EH+HKn6r6JGCKAUPjHtflpAhr/Y/J1+b5bkeHR8vaPE8DeT3sAV+F3nqtbC7ZjW+dj
         Hl0vKQmesooPSLeIi6XdEAQrIqaCMy+1WS3Y3QE3w3q0FuAZ5SeEkR+lQlKhf4WVGyVC
         prTWSGjdmYSUCnQXYGJF+8MVaismm9ZM8SveVFHVmzssl/FvvkQ2fyrDQsjmfiCGvls3
         8jmCNX6ac0GDRbj2XXY0a0vC+tZ0exI6F+YmsIScTIpL8zxlvcRIJRsZSSZNVG2PQnZY
         TD5I4RIE3gZyFSY/646zV0qPlyyumH72lsYxnTlkPrBvKgDxdVq/DIMQw+ON6UKDBcQ9
         PNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712694744; x=1713299544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12JndML8/JCJgkfhvekK/G81mXPrA5btch0gZl1J20Y=;
        b=Id3b+dIOFiDrCnlplFI3RJRzeHuNUrzj3Qr+D0jjQt9BL9stwc7qsuEX9NrttW0DkK
         NchlbT3Z2736Z5DVtQYvtiJlo0yOAKj29Kt2yj77DregaahXB09LF9++tTP0tudXSR3z
         P7D0R95+YjVjPyhEHIkTPBCcqll8rAWv5i/dGMii6UsBobaTk78g/Ge6b9RsVIvWG5OA
         fxySXKVwjgXCTnm8nSM6aOMcgBR/7XZ+T7QMDI4+ePLMmEqKkJEBp6Rulpc1HP1E+ndt
         scTWhRnyZrXeuuagbeX3m1ihYTOoqxDRtxgO/oLbKtw8HGoRCQyautPVfckHQvzYEMS+
         b55Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsv3VtuuI2nOOobDH2gR879EVyUJt4ki8yJpD5/wbrw0zBwux7g/MxXCyLDfzTGWZyVn2Ap4QmFc0Yf7o42ZegvFdSXrGPvUXoSFr0wdWpIm0=
X-Gm-Message-State: AOJu0YzbYov3zZq84joqzVR8J8wT7YUiH48wNmIZ++qv/rSCVEJ1Bes6
	0xlMdA0WcsJLlk0lwCWsjJTQLLoTy7bUGgqajCzIONfojXR9y9M4UyNPTU7yZQ==
X-Google-Smtp-Source: AGHT+IF6oY374Gn1bXDaQ8XjzUkuKAfKS8zqbkpsnbHTg5x0Nbbqftz5Mn2zC4LTwQ42ph5VlmKPrg==
X-Received: by 2002:a17:903:2451:b0:1e0:294f:17c0 with SMTP id l17-20020a170903245100b001e0294f17c0mr58171pls.4.1712694743398;
        Tue, 09 Apr 2024 13:32:23 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001e421f98ebdsm4644271plr.280.2024.04.09.13.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:32:22 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:32:19 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
	bvanassche@acm.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	chanho61.park@samsung.com, ebiggers@kernel.org,
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com
Subject: Re: [PATCH 14/17] scsi: ufs: host: ufs-exynos: allow max frequencies
 up to 267Mhz
Message-ID: <ZhWl0_LSOIjdza9C@google.com>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-15-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404122559.898930-15-peter.griffin@linaro.org>

On 04/04/2024, Peter Griffin wrote:
> Platforms such as Tensor gs101 the pclk frequency is 267Mhz.
> Increase PCLK_AVAIL_MAX so we don't fail the frequency check.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Tested-by: Will McVicker <willmcvicker@google.com>

I tested this patch series on a Pixel 6 device. I was able to successfully
mount two of the Android ext4 partitions -- efs and metadata.

  root@google-gs:~# mount | grep /dev/sda
  /dev/sda5 on /mnt/efs type ext4 (rw,relatime)
  /dev/sda8 on /mnt/metadata type ext4 (rw,relatime)

Regards,
Will
