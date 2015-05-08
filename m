From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2] libgencec: Add userspace library for the generic CEC
 kernel interface
Date: Fri, 08 May 2015 12:59:29 +0200
Message-ID: <554C9711.1030600@xs4all.nl>
References: <1430760785-1169-1-git-send-email-k.debski@samsung.com> <1430760785-1169-13-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1430760785-1169-13-git-send-email-k.debski@samsung.com>
Sender: linux-input-owner@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: m.szyprowski@samsung.com, mchehab@osg.samsung.com, kyungmin.park@samsung.com, thomas@tommie-lie.de, sean@mess.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-samsung-soc@vger.kernel.org, lars@opdenkamp.eu
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kamil,

On 05/04/2015 07:33 PM, Kamil Debski wrote:
> This is the first version of the libGenCEC library. It was designed to
> act as an interface between the generic CEC kernel API and userspace
> applications. It provides a simple interface for applications and an
> example application that can be used to test the CEC functionality.
> 
> signed-off-by: Kamil Debski <k.debski@samsung.com>

I still strongly recommend that this library is added to the v4l-utils
repo. That already has support for v4l, dvb, media controller and IR
(i.e. everything under drivers/media), and the CEC library/utility should
be added there IMHO.

For example, I might want to use it in qv4l2, so being able to link it
knowing that I always get the latest version is very useful.

Also, v4l-utils is always updated to be in sync with the latest media_tree
kernel, and since CEC is part of that you really don't want to reinvent the
wheel in that respect.

There were objections in the past to renaming v4l-utils to media-utils, but
perhaps this should be revisited as it hasn't been v4l specific for a long 
time now.

Regards,

	Hans
