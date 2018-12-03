<template>
    <form>
        <div class="form-group row">
            <label for="worship_type" class="col-sm-2 col-form-label">崇拜</label>
            <div class="col-sm-4">
                <select class="form-control" id="worship_type">
                    <option>早堂</option>
                    <option>午堂</option>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="user_name" class="col-sm-2 col-form-label">姓名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="user_name">
            </div>
        </div>

        <div class="form-group row">
            <label for="group_name" class="col-sm-2 col-form-label">團契</label>
            <div class="col-sm-4">
                <select class="form-control" id="group_name">
                    <option>雅各團</option>
                    <option>安得烈團</option>
                    <option>所羅門團</option>
                    <option>迦勒團</option>
                    <option>基甸團</option>
                </select>
            </div>
        </div>

        <button type="button" class="btn btn-primary">Submit</button>
    </form>
</template>
