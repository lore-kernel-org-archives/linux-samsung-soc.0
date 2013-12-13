From: Daniel Drake <drake@endlessm.com>
Subject: Re: exynos-drm 1024x768 HDMI output
Date: Fri, 13 Dec 2013 09:46:52 -0600
Message-ID: <CAD8Lp46m5VqNNbM2rSEFsOxUT1XW=35FUo6We_u0f8jNP+=dag@mail.gmail.com>
References: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
	<CAOw6vb+58XZFzxkzfBRfRFObfY5+q29Yk9_qkesGg+kqSYYB+w@mail.gmail.com>
	<CAD8Lp47N_E-ANOA4QH4UaDyeDJE59XdHH1K9shKQREegaeTnPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAD8Lp47N_E-ANOA4QH4UaDyeDJE59XdHH1K9shKQREegaeTnPw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 12, 2013 at 4:46 PM, Daniel Drake <drake@endlessm.com> wrote:
> What I feel we are missing here is an explanation for why the first
> row of pixels is treated differently from the rest. Every value that I
> tweak seems to have an effect on the first line (which was rendered
> OK) as well as all the others (which were bad). If it were just a
> matter of tweaking e.g. h_fsz then I would expect *all* rows of pixels
> to have been rendered badly in the first place.
>
> Nevertheless, I'm happy to continue throwing values at the variables
> if that is our best option... We need to find a way of making a change
> that effects the only first line, or all the lines except the first.

I have an idea, but my understanding of CRT timings isn't quite strong
enough to tell me exactly how to implement it. Maybe you can help
suggest what variables to tweak in order to try this experiment:

Lets just accept the fact that the first line of the output image is
rendered badly. Specifically, it has 257 black pixels added onto the
end of it. The following rows do not exhibit that problem.

To accept and ignore this oddity, I want to make the device start
outputting the image exactly 1024+257 pixels too early. i.e. I want
1281 junk pixels before the image starts.

Then, I want to adjust the timing parameters appropriately so that
those junk pixels do not appear on the display. I want those 1281 junk
pixels to be sent to the display during the horizontal scans that
happen before the top left visible pixel is clocked. I think I'm
saying: I want to adjust the field of view so that those 1281 junk
pixels are rendered inside the vertical back porch.

Does that make any sense?

Daniel
