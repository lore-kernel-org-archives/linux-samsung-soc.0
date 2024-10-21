Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E05176ADE;
	Mon, 21 Oct 2024 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729528375; cv=none; b=HxuyYST2+ejpQfq6hsG6XLQoDUDuvxOw79ua7Hs/aVcc8fDBKPb77DSdzim/OIXIF+W5tusA8bLzOe06ISS5X+uQRmDgupWVmYj585zLj1krUJVVAjr8jLqB44BuhehI0Y+mulO7oLeaY8ZQf0El3Rt7v9bvB35CFT1+UvBY9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729528375; c=relaxed/simple;
	bh=Yihx4OBCFOrFynTc74Tq18dgCbePHWLDh/fIeU6Vj9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e23t00oczr3I53x+KrqF/AalQ77Vkh7tv/8S2O1Ve98GK1H0BLglvA8IWJv41NGgCYPTKqLxnWbPpW5LM/2fy8RrIkigAFsQ1LKYSEmuNa+8avriDFPEYCJiLKc+vd3cdI5KSFZ5NFweKrs8/E2+vgDCjCrQIAv79ut82SXvjd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux3dDeKq; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux3dDeKq"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5eb5be68c7dso2360488eaf.0;
        Mon, 21 Oct 2024 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729528373; x=1730133173; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MrzY8FX0o3tCNAy1+JzEq7soWHSgKMYxkffvY3oKiR4=;
        b=Ux3dDeKqrF5zrYHMENBOY41pzTWuCrFV/0CtL+TwNG3TV7vkj5NhX6IYiaQMOV7Zgx
         d9/PYZNa5GpDLs8lg6o1YJMmqmJTpgGC+OR8SxwsGOK56ulWc2oTBPKfftVWB15jFJ+G
         jsfoIE6Vxcu8GhOu1KK7Mxv5Sfl4LSZ/0c+KCtqJN/3668DlcTAoaqoO8MMRfq3GEFmu
         /bF6q/OPfRAu3TYB7WQUMyRYkNq1cXAPG2Z3980zcedHjXnDQrLukIo15FT/a5C71hSp
         9RgrqjgCACnL4NpvKMp+dfX+FYmS3J5SYfKH30WQgatravSWoKNj+TL7tsSaD7mdpl9J
         uJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729528373; x=1730133173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrzY8FX0o3tCNAy1+JzEq7soWHSgKMYxkffvY3oKiR4=;
        b=TNK12d9c4Av02+KXutWjIoqjEJlqEVz+tJTayY3smtwXai0p0APqQmFLAu1E9HX/3b
         amF4a/qoBrjAwj6S5nHZIr0DWhL9GhHO+NqPRrhWfO+12k3CZn/GxkZA3peCakjDNwtm
         ZY/OWvhnDAIWyYxI+U3vyQQGcnMEY7xx0Tvc6/TVBe+zyzixhfMUcEODDmVoKPi1FSGx
         95hqutG28DLk0ON/KeUchmgWlCRfk/2KvPXq/T21ePaxM/RxtR/L7FE+C9drJERMqANG
         n8+Rzk68qGeYgO9EKa39W8gor0m+HXpBOwCLb+wzLRD9FpS4NYHeAL44eKU0CntT6prI
         ZDPw==
X-Forwarded-Encrypted: i=1; AJvYcCUg4s//DFRZOnsn6OZddoFik6whezC4uCFdBGys324KaIEwTa0TutGjx6SNZ404rUKn64iTfAp622rtffw2spVl+ds=@vger.kernel.org, AJvYcCVkOhryZwJnZeqUUO5zDMNj8H/hRiLY9kNfhYwlrQUXo96ySvqqSdPYic9AoiU9yE8rbstrwQoeIZFwJkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQ375eU+SxAUwQvRr84Yk/DGiVL+6+pvCsDrgyXAb1NnhoC2E
	i2Bq1CuE6s656PeVdmvYDVSm+0laqljxF2u8NB/MF70L+9NnjUjAyjk0O6w5f+EhUPyVE9RiMHV
	/ONrESzkdKVB0cKAWRhdEBiHJtHo=
X-Google-Smtp-Source: AGHT+IEn4t4ywdyEIc2ujFckXZRJ4voSSqvPHcqIRxybRnnDS2ybHZCLMiQBypVRPSAS4yG7uPp2TmoQ7GzRkKjgoYg=
X-Received: by 2002:a05:6820:c91:b0:5e1:de92:6b66 with SMTP id
 006d021491bc7-5eb8b3b2219mr8861843eaf.2.1729528373020; Mon, 21 Oct 2024
 09:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org> <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org> <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
In-Reply-To: <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 21 Oct 2024 11:32:40 -0500
Message-ID: <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com, 
	javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org, 
	luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com, 
	bjorn@rivosinc.com, ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	marcan@marcan.st, neal@gompa.dev, alyssa@rosenzweig.io, broonie@kernel.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, peter.griffin@linaro.org, 
	kernel-team@android.com, vincent.guittot@linaro.org, 
	daniel.lezcano@linaro.org
Content-Type: text/plain; charset="UTF-8"

> On 10/18/24 8:49 AM, Tudor Ambarus wrote:

> The active request is considered completed when TX completes. But it seems
> that TX is not in direct relation with RX,

TX and RX are assumed independent operations (which they are).
TX is sending a message/request to the remote successfully. 'Success'
can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
ACK}.
You seem to assume it should always be an ACK where we receive an
acknowledgment/response packet, which is not the case.

...

>> Correct, and it is not meant to be.
>> You are assuming there is always an RX in response to a TX, which is

> Not really. If there's no response expected, clients can set req->rx to NULL.

You are assuming the default behaviour is that there is a reply
associated with a TX, otherwise "clients can set req->rx to NULL".
This api can be _used_ only for protocols that expect a response for
each TX. For other protocols,  it is simply a passthrough wrapper (by
doing things like req->rx = NULL). For handling this special case of
Tx->Rx, maybe a higher level common helper function would be better.

...

>> reasons, it is left to the user to tie an incoming RX to some previous
>> TX, or not.

> Is there a specific driver that I can look at in order to understand the
> case where RX is not tied to TX?

 Many...
 * The remote end owns sensors and can asynchronously send, say
thermal, notifications to Linux.
 * On some platform the RX may be asynchronous, that is sent later
with some identifying tag of the past TX.
 * Just reverse the roles of local and remote - remote sends us a
request (RX for us) and we are supposed to send a response (TX).

> Also, if you think there's a better way to enable controllers to manage
> their hardware queues, please say.
>
Tying RX to TX has nothing to do with hardware queues. There can be a
hardware queue and the protocol can still be
"local-to-remote-broadcast".

While I don't think we need the "Rx is in relation to some past Tx"
api, I am open to ideas to better utilize h/w queues.

The h/w TX queue/fifo may hold, say, 8 messages while the controller
transmits them to the remote. Currently it is implemented by
.last_tx_done() returning true as long as fifo is not full.
The other option, to have more than one TX in-flight, only complicates
the mailbox api without fetching any real benefits because the
protocol would still need to handle cases like Tx was successful but
the remote rejected the request or the Rx failed on the h/w fifo
(there could be rx-fifo too, right). Is where I am at right now.

Regards,
Jassi
