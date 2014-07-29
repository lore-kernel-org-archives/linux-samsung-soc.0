From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: s5p_mfc: remove unnecessary calling to function
 video_devdata()
Date: Tue, 29 Jul 2014 15:08:59 +0200
Message-ID: <53D79CEB.2020208@samsung.com>
References: <1406088372-5240-1-git-send-email-zhaowei.yuan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53031 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbaG2NJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 09:09:07 -0400
In-reply-to: <1406088372-5240-1-git-send-email-zhaowei.yuan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Zhaowei Yuan <zhaowei.yuan@samsung.com>, k.debski@samsung.com, m.chehab@samsung.com
Cc: linux-media@vger.kernel.org, kyungmin.park@samsung.com, jtp.park@samsung.com, linux-samsung-soc@vger.kernel.org

On 23/07/14 06:06, Zhaowei Yuan wrote:
> Since we have get vdev by calling video_devdata() at the beginning of
> s5p_mfc_open(), we should just use vdev instead of calling video_devdata()
> again in the following code.

Applied to my tree, thanks.
