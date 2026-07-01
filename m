Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82127395D86
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jul 2026 18:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931663; cv=none; b=CejOx7qSjfFaDdOoGGBWu80DnmCGFXLPH7LIjQSkJbRY75xkBQqJipio3Uwi6RbJYXoAfydEPTEobb017oUkpNVjXAHZ934CCIq19Qp+3WOdlQ15hhW62jBh+zPS2j2aTd96U4R8lmZMgX8v0+RCwikijoV9xV+QO7tXLKSWr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931663; c=relaxed/simple;
	bh=/qWtFqHBkrtLXXAD1XpvUaW1zHKMs9ArEGyHDtyLBkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOmDK/gUCN3/Ek00FyDNzdE+xoucVRBlYixoOJSYcbIfLO59dAGfyyB8w8Jxhifk8T3g0QDEuzroXNTtWBwFbKXFAbrIm27XvgDyf0jLrFL30P5OaEIiCuVSPzBdU67mlz6VyCzQrN+dNUt3SePObeZck9xQYsEcLMe7ujrBmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QLyO9jKG; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QLyO9jKG"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2c82538b6c0so9568565ad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931662; x=1783536462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=iNs9j0lAbh/vBKPzZ+KzeAbfl/IbX4sayKSE3g7zxWzvDQpISoiwG2AaWsWu/2pn9v
         /B4Ii3K7NDGkL7dgok5adWvOLE0lQs0iJPjrDBFPoPF5zEhMxtBV5Drzuw79LRVbjzm1
         qr/slxBZY2FKoQcG+HthgEZeRiSAYPVwptP24YnhEaQE2eqzQU6mZKFpmUzYgtYOpe8b
         9YbX6OTBjJBEZquM0RgvwP0EqFDa26LjRH2ZsWs7AdGIf8Ss6zE1SPjfVAyGqClIndJS
         J7+j4zfOzlK7/RcORbIVzhnOT5wPBE14D0SoSLdyJGbwsTnEfNUN9izHUvi0bvCwfUZ+
         5kTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxj0wPEvA6O8Rt7P73GdvxfKNYVgpnwGTJ8GGj7k7UBW9LZBLMAUVU4GOOFf/30kBgPyB4n6a8o4hkXuN+L1uWYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysD9qTB2dDSpLjEflDq3ZWNIXqjsh859VSgd75cR70yjnMLlgv
	uuY4KUZbCjK/6/IL059oIYC+hrtlJv0pyuqRwkxxtK+f1x0pJAmpKFdhCPD1qu06NwItJvXhwdu
	gUumdts2PtfCwtkudOKMST9EGAhG2/Ltbh8/3QJJyn15HXX3ZGduVlyn3hlBUuAaHfBQO4P65qY
	qU2p23bxc/wOCIWhLw87Z1ZfDfBgob6cZyyhleZT6vRRA/iS+2DyNwZJd6Xtt7lOtYm4nVpxhmV
	8gWIGzUyVB1Hzpf2awu8tNnY53891k=
X-Gm-Gg: AfdE7cmpNDAvmDUtQMDVRL+FJs0dW5GwiCEdoN3K0ZaUR63P12to7uG1XvlxNBaKZ01
	1IIj1dU+y8ISePq8Npda6bCZUJRNEn9b7MX54JSWp8XYS+KlCmYtTQBfJSgVKQdnB0o11o76SPJ
	8QouAljYqVt1e3yk5lpnsa1fReJqJL5ct+dYyruwzBDlHdIE+S1eYN7fEnnpXXYJ9l1sydLiKng
	4ct4lR6MF6S0ct3SmUTPCcz8RJXAyNbgn3bs52B5rJZAoFAZ5KLeWbxpq3Q5TQuwRyuvEXvXSFH
	8DOjImXRS76OCKBASLORAj1WqTrd7sh0WTtGegot5CN1V/7yCI05DyXv0jZDnh2WcJLA2cHVSgk
	6zFREG2ruk/a5MOv+3sY/FmCD7g3T5pQpMrSeu3NesBU9G27HY5aO2sIidzFWi321kPfNa3UNtm
	nOz3slEr3/D9iZDAUHazjj9rTRaVraVvWORYFvxB473TqX3xGYcKncbw==
X-Received: by 2002:a17:902:ceca:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ca91243db7mr17533525ad.46.1782931661728;
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ca9a8c144csm327245ad.5.2026.07.01.11.47.41
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so8651981cf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jul 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782931661; x=1783536461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
        b=QLyO9jKG++R7FF9qSPift3aqkD7X4VtrFmS9WWR8whSLC+BlN2vreZvVws0R+8QYNc
         t4AB1cMh4w1awn/e3TVm/Np21oNySvFUp3c8+FTAmubXlVWVtT5Hlp96/U/pyd3aY+y+
         CvOjHqK1+h1DLVv8tzuK6F+mcQfnXUKtFgVU8=
X-Forwarded-Encrypted: i=1; AFNElJ+cpwiW6ZtSmZ58zCxOBeYo1SQS75vMuov5rS7bzCMMPKIJJXq1eM77NHKGoV2AzT9jU6ZL93l3u1d6YUepFqosQA==@vger.kernel.org
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-51c2ad5c37bmr24012641cf.25.1782931660581;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-51c2ad5c37bmr24012221cf.25.1782931660134;
        Wed, 01 Jul 2026 11:47:40 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d149sm57936471cf.1.2026.07.01.11.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:47:39 -0700 (PDT)
Message-ID: <d37a738d-f316-42cf-8dbc-99a732a33240@broadcom.com>
Date: Wed, 1 Jul 2026 11:51:57 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm: uapi: Add macro for chipset specific event ID
 region
To: Bence Csokas <bence.csokas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Daniel Kiss <Daniel.Kiss@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20260616134802.636166-2-bence.csokas@arm.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260616134802.636166-2-bence.csokas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
