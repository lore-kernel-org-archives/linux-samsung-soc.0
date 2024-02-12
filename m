Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68313FF1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707724863; cv=none; b=CVzhjPdfW0cg4dAIsMSscUoX/qYqdu5oD6YBCLT/uQFLo1iVhNFl+oP8nIvH34DfXkFnBRCw+bTdGAu+qejMUNezzHiD85SBLh23g+z+qJXGium2yLNqE0kOzCvHC6bwJ8v+LrmPMwNy19De9xpkg6UDakU2U3CjWCzLIDBBgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707724863; c=relaxed/simple;
	bh=bgv5RdC77n/PTT/J371lb6F7hPd7oWmVCVjSctYXnWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZVVErggkaAEyVl0qC3WKTOsinruQKHY19nXohdk24oSsNpfGWg3OpPTKqk2RVZFH5zWOapcQjEXI2ah6RV54mbe3lt28EOM5KUJryhyRZNJ0Z1XCTnTA7nU2Y2Uo80JkhJmCbC+dAI9PLkVYDZ7xXRyV4O6zuqup2yM78w/xT5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1GFIS8a; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1GFIS8a"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cf1fd1cc5bso36004621fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 00:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707724860; x=1708329660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHvXGwviFkH/t0WncAdojj7zBVQIStnGPAIN9rB+ikY=;
        b=n1GFIS8aIF+yt05dMykBnB8amBIHLGBGPiFOx8H+iQVsuWfmimQZ5jPWjqFeOE0wMg
         28b0yuZnfF6Rm+l76cqypSIuqUh8AFbzJ0xpwvtOB3pmh35eHhVvC+Q+Y+3SzWay3D1D
         8Ggb1ysi+gptwwvl9eC8sjZvUUjA3CMP37N9D8qC4w5RL1cRGi2tGao36uOv+Q5eomNX
         KqZowvyNxtm1WQLo9aDorvuxBsv7mjkIr25uOe2943rZ0SF+j6/1KSKcHVNJRmvcETmh
         4CV7nwEWxi9GstuQldlXatFnwtW8FEkaQOVd7G+ZfVqVXqk0JdhK3ewLsZJ4d6UGel9p
         UtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707724860; x=1708329660;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHvXGwviFkH/t0WncAdojj7zBVQIStnGPAIN9rB+ikY=;
        b=rXv0RWVD68GmxkUMs2+VHdHUqZVSqtIQi6Pa5B6TQ++5bRMcCjRVw/sJHz4OjmSmjE
         dUQ7QIzSBClfmsaSPC12wSi2ur5Bs5dG7XaY3ZhB+Lh1EBNmmA1OwLgNA+Tk1WfdW2nm
         kvuaPOUlYEmllZjoMOVuMPiKYRvCslSJnv43v6Ju9atNIto+ItQbMwdGRTttNBs8/75R
         /8m/cUr6Gq86+LjT/aUvBGgzX4JbOPtGqSP990gBmfhJkXAD4NOe4cRpN73gAtVs3EjO
         HIOhhRU26VUN01X85KoJEWEZpcGqKDhWe95zUuB7eHgMDzbRfzOowuY72R+hvj97vmn/
         WyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzrhGsU0+E1sjcGR4Wk8qGmaGie4zLwew7BhbPe5SwF7j0ePBJiv+9pqFpcQNqLe271kYjOYCTqV8KKYgMjP9o6wr1jMnU3EL4FQ0hD0L/wT0=
X-Gm-Message-State: AOJu0Yyf6InJzWuLg0PRtK8jXz+2rVNKqaZdmeUd9Wt74riKWlo8Z+I8
	xkbJod/tlh+2iFex54jmc3Di5lLQNDcHfxggNN/HLbfhWOt9uLdO5WmGEVkIoVY=
X-Google-Smtp-Source: AGHT+IEOUip9Mfu7SWwu7DiRZPOo1T4hbkFaQCvsdxfTEnT6DqFQGp+WtTXerXpUdHVySOE0+14mtg==
X-Received: by 2002:a2e:91c9:0:b0:2d0:e0cc:7865 with SMTP id u9-20020a2e91c9000000b002d0e0cc7865mr3534647ljg.43.1707724859882;
        Mon, 12 Feb 2024 00:00:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVgpiYXorB3X/EWxB3hse9pm60pVWCUp88yliSb4p/J4bCT4xuKU7dVVVpDLzhaXlhjRL1FNKMJteyxB+wiqPz6UwZE4rItNKVmNf6yyJkOg0b+EIa/2R6j5C332LN6VO+wPxim7fL3dYVSFC2fFkKYQY/ABPP8K1j8RjOqJd4lxa77TwIkjAW3MDZfvmD/5kkye3Q+UMbv1FZ7cQcN0cQtrsJgfqwQDTRcdBU4TJw9DTMzNnxzEv6
Received: from [127.0.1.1] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id x9-20020a2e3109000000b002d0ceefd3e9sm1315818ljx.99.2024.02.12.00.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 00:00:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240211-bus_cleanup-arm-v2-1-3de9e8af7cbd@marliere.net>
References: <20240211-bus_cleanup-arm-v2-1-3de9e8af7cbd@marliere.net>
Subject: Re: [PATCH v2] ARM: s3c64xx: make s3c6410_subsys const
Message-Id: <170772485844.8549.14056972492264035636.b4-ty@linaro.org>
Date: Mon, 12 Feb 2024 09:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sun, 11 Feb 2024 12:57:09 -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct bus_type
> a const *"), the driver core can properly handle constant struct
> bus_type, move the s3c6410_subsys variable to be a constant structure as
> well, placing it into read-only memory which can not be modified at
> runtime.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c64xx: make s3c6410_subsys const
      https://git.kernel.org/krzk/linux/c/a3891621d4a0783ae178d6f2845517e3dd571dd4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

