From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 2/5] h1940: fix h1940-bluetooth compilation
Date: Sun, 26 Sep 2010 00:39:43 +0100
Message-ID: <4C9E883F.1010608@fluff.org>
References: <1283871605-32068-1-git-send-email-anarsoul@gmail.com> <1283871605-32068-3-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:55908 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754232Ab0IYXj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Sep 2010 19:39:57 -0400
In-Reply-To: <1283871605-32068-3-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 07/09/10 16:00, Vasily Khoruzhick wrote:
> h1940-bluetooth.c doesn't compile after s3c gpio API changes,
> this patch fixes issue.

As a note, in future it would be very useful to have the part
of the build output showing the failure when submitting a
bug fix like this.
