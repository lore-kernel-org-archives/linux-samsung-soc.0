Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367D28E7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722393730; cv=none; b=oI8MXtUxSTYWlc1Kao7EOXJKxRzDnh7A7oA+k2NZiPFaXMpE7ediQlqWBRiJdkNRcnESMDDC58/nTSPAp+fYrsfsDuti0VaUpclBv7pBgt7Y6StImN60DqXm52FNVneyj8MfkhlMdEUeHJrHbJjnl3+bk1y2K3jHc8t0wCHv4AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722393730; c=relaxed/simple;
	bh=yKIt4RHVuiK7oxdellYCbKb+icg84eSU/D3zZPmELVM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUSkTU4hdGUBYswhoh/60WNXEtccYkl81An1u/kIGtSCDJQ9Ve/8/2Q0F/6hqhzOoX/u7qjpR+5F7iBPCK2tXtIJJ9VUdwN9kYBuzkHsq/XEcdpd09K+46rTLhupbARBMqWGdX/p2N7a/bX0VY1JIVxFyW2kbEiLHGKV0dE158s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuH7Q1i5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuH7Q1i5"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d19c525b5so3560761b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 19:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722393728; x=1722998528; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yNToOQj6POlNRrh+5w4EnVtpcv4XG/AsalJEWTahmY=;
        b=FuH7Q1i5PM+Ynhgv/fOKpC3I2N45PVU71d8diXBC+mqFaADP3DN9fZahW6ETa1NDD7
         tip33CjPfw9BgEuDPWe4F6KI9yTF0b0KPeNL2ScyyKHnGLYCqj0jzfi/eO3SvsBz1SJ2
         oZ6pdeIWkpzNBZnEuBPUvNtOa1KWoZ0+hN8+YZ1nMIWZdO7iXFNd1cZTOeXdAINWT6DD
         cu1ofdLRWl1tjVIbr1kC0lrlJ30ypIZVVB9dqOK/Ig5LFporwmf3Fo5JIa1WwVYcR0mP
         NBSSTH8v+uIczdWAJV2Fh05Oow2T4WTzTRLQjcKZBt4Ruki0Bc5rI0ha63t1Dnhyyuvd
         63aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722393728; x=1722998528;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yNToOQj6POlNRrh+5w4EnVtpcv4XG/AsalJEWTahmY=;
        b=Z6ibRAqzszkPBvD+zYLHD1Aa/xXb3AcWDCQEHDoj6GDw/lQtgUPvPO+sFCsnvzojgw
         bI/G7DJMoQtq/W6IXONOqSfunowjvSvy7EknNPUHPLoMWvdD7PjYQjJOuOZyVFOe4Zao
         4a3dEryoLGzdrqds+Xwzz8/hXXvc29HmCeZZF3EGtydByZbM+DIi/T+C9FqUtU0CI7Fr
         6JyqD9fTZM0eRORG7b0CyHqafBPWJq+f4nd3dp19OlRD28c4XcTOhGjj9bcTIn3FPYe0
         t7nkS8Qi6OZdHcqyFCVtlJRVDNcqzxOXNtJhMNKvK2Z+p0CNNR2jrGuAf9PqOpgqUcdX
         ayRQ==
X-Gm-Message-State: AOJu0Ywgm1nuX/lczdWPzOw5QeGK6XTvm7JOdhKCbQFTM6+3xqC1KocE
	3yCk3TRSOqRI1eycwnminJ470r2aCJlWIUdFLmEd89Wu63mys3g0yk3Y+w==
X-Google-Smtp-Source: AGHT+IEAaW05KxsDjYsb21JqXGaGTDbmh9NoRJtnE3+Vx8rHaB/WlSgJOe2/ExbF3LaBwscRafQDcA==
X-Received: by 2002:a05:6a00:9a6:b0:70a:f3de:3f2 with SMTP id d2e1a72fcca58-70ece9ec023mr12753017b3a.3.1722393727959;
        Tue, 30 Jul 2024 19:42:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1d80:5c93:e030:d766])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead812316sm9088197b3a.101.2024.07.30.19.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 19:42:07 -0700 (PDT)
Date: Tue, 30 Jul 2024 19:42:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: mach-crag6410.c staying or going?
Message-ID: <ZqmkfEijDcE--F0L@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I would like to remove platform data suppirt from samsung-keypad driver;
mach-crag6410.c is the only user of samsung_keypad_platdata structure.

I started converting it to software nodes, but I noticed the following
message:

../arch/arm/mach-s3c/s3c64xx.c:423:9: note: '#pragma message: The
platform is deprecated and scheduled for removal. Please reach to the
maintainers of the platform and linux-samsung-soc@vger.kernel.org if you
still use it.Without such feedback, the platform will be removed after
2024.'

So is this board/platform being dropped? If so when?

Thanks.

-- 
Dmitry
